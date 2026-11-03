import { workflow, node, trigger, sticky, newCredential, ifElse, expr, placeholder } from '@n8n/workflow-sdk';

const fromSourceCheck = trigger({
  type: 'n8n-nodes-base.executeWorkflowTrigger',
  version: 1.1,
  config: { name: 'Called by Njia 1', parameters: { inputSource: 'passthrough' }, position: [0, 200] },
  output: [{ runId: 'run123', pendingCount: 2, items: [{ id: 'cr1', targetCollection: 'residencePermits', targetId: 'DE-student', summary: 'fee 75 -> 90', approveUrl: 'https://...', rejectUrl: 'https://...' }] }]
});

const weeklyReminder = trigger({
  type: 'n8n-nodes-base.scheduleTrigger',
  version: 1.3,
  config: { name: 'Monday 09:00 reminder', parameters: { rule: { interval: [{ field: 'weeks', weeksInterval: 1, triggerAtDay: [1], triggerAtHour: 9, triggerAtMinute: 0 }] } }, position: [0, 500] },
  output: [{}]
});

const settings = node({
  type: 'n8n-nodes-base.set',
  version: 3.4,
  config: {
    name: 'Settings',
    executeOnce: true,
    parameters: {
      mode: 'manual',
      includeOtherFields: true,
      assignments: { assignments: [
        { id: 'projectId', name: 'projectId', value: 'njia-prod', type: 'string' },
        { id: 'reviewerEmail', name: 'reviewerEmail', value: placeholder('Reviewer e-mail address (set in n8n, not in the repo)'), type: 'string' },
        { id: 'reviewerPhone', name: 'reviewerPhone', value: placeholder('Reviewer WhatsApp number with country code (set in n8n, not in the repo)'), type: 'string' },
        { id: 'waPhoneNumberId', name: 'waPhoneNumberId', value: placeholder('WhatsApp Business phone number ID (set in n8n, not in the repo)'), type: 'string' },
        { id: 'adminUrl', name: 'adminUrl', value: 'https://njia-prod.web.app/admin/changes', type: 'string' },
        { id: 'reviewBaseUrl', name: 'reviewBaseUrl', value: 'https://europe-west1-njia-prod.cloudfunctions.net/review', type: 'string' }
      ] }
    },
    position: [260, 200]
  },
  output: [{ projectId: 'njia-prod', reviewerEmail: 'a@b.c', reviewerPhone: '49123', waPhoneNumberId: '1', adminUrl: 'https://', reviewBaseUrl: 'https://' }]
});

const settingsReminder = node({
  type: 'n8n-nodes-base.set',
  version: 3.4,
  config: {
    name: 'Settings for reminder',
    executeOnce: true,
    parameters: {
      mode: 'manual',
      includeOtherFields: true,
      assignments: { assignments: [
        { id: 'projectId', name: 'projectId', value: 'njia-prod', type: 'string' },
        { id: 'reviewerEmail', name: 'reviewerEmail', value: placeholder('Reviewer e-mail address (set in n8n, not in the repo)'), type: 'string' },
        { id: 'reviewerPhone', name: 'reviewerPhone', value: placeholder('Reviewer WhatsApp number with country code (set in n8n, not in the repo)'), type: 'string' },
        { id: 'waPhoneNumberId', name: 'waPhoneNumberId', value: placeholder('WhatsApp Business phone number ID (set in n8n, not in the repo)'), type: 'string' },
        { id: 'adminUrl', name: 'adminUrl', value: 'https://njia-prod.web.app/admin/changes', type: 'string' },
        { id: 'reviewBaseUrl', name: 'reviewBaseUrl', value: 'https://europe-west1-njia-prod.cloudfunctions.net/review', type: 'string' }
      ] }
    },
    position: [260, 500]
  },
  output: [{ projectId: 'njia-prod', reviewerEmail: 'a@b.c', reviewerPhone: '49123', waPhoneNumberId: '1', adminUrl: 'https://', reviewBaseUrl: 'https://' }]
});

const readPending = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Read Pending Changes',
    executeOnce: true,
    alwaysOutputData: true,
    parameters: {
      resource: 'document', operation: 'query', authentication: 'serviceAccount',
      projectId: expr("{{ $('Settings for reminder').first().json.projectId }}"),
      query: '{"structuredQuery":{"from":[{"collectionId":"changeRequests"}],"where":{"fieldFilter":{"field":{"fieldPath":"status"},"op":"EQUAL","value":{"stringValue":"pending"}}},"limit":50}}',
      simple: true
    },
    credentials: { googleApi: { id: 'VVUOOS1FNgA7B8Bn', name: 'Google Firebase Cloud Firestore account 3' } },
    position: [520, 500]
  },
  output: [{ _id: 'cr1', targetCollection: 'residencePermits', targetId: 'DE-student', approvalToken: 'tok', diff: [] }]
});

const buildReminder = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Reminder Payload',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const s = $('Settings for reminder').first().json;\n" +
"const rows = $input.all().map(i => i.json).filter(r => r && r._id);\n" +
"if (!rows.length) return [];\n" +
"const items = rows.map(r => ({\n" +
"  id: r._id, targetCollection: r.targetCollection, targetId: r.targetId,\n" +
"  summary: (r.diff || []).map(d => d.path + ': ' + JSON.stringify(d.from) + ' -> ' + JSON.stringify(d.to)).join('; ').slice(0, 300) || (r.evidence && r.evidence.quote ? String(r.evidence.quote).slice(0, 200) : 'see admin page'),\n" +
"  approveUrl: s.reviewBaseUrl + '?id=' + r._id + '&d=approve&t=' + r.approvalToken,\n" +
"  rejectUrl: s.reviewBaseUrl + '?id=' + r._id + '&d=reject&t=' + r.approvalToken\n" +
"}));\n" +
"return [{ json: { ...s, runId: 'reminder', pendingCount: items.length, reminder: true, items } }];" },
    position: [780, 500]
  },
  output: [{ runId: 'reminder', pendingCount: 1, reminder: true, items: [] }]
});

const buildMessages = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Messages',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const p = $input.first().json;\n" +
"const s = p;\n" +
"const items = Array.isArray(p.items) ? p.items : [];\n" +
"const n = p.pendingCount || items.length;\n" +
"const esc = (t) => String(t || '').replace(/&/g, '&amp;').replace(/</g, '&lt;');\n" +
"const rows = items.map(it => '<tr><td style=\"padding:8px;border-bottom:1px solid #ddd\"><b>' + esc(it.targetCollection) + '/' + esc(it.targetId) + '</b><br><span style=\"color:#555\">' + esc(it.summary) + '</span></td><td style=\"padding:8px;border-bottom:1px solid #ddd;white-space:nowrap\"><a href=\"' + it.approveUrl + '\" style=\"background:#0b6e4f;color:#fff;padding:6px 10px;border-radius:6px;text-decoration:none\">Approve</a> &nbsp; <a href=\"' + it.rejectUrl + '\" style=\"background:#999;color:#fff;padding:6px 10px;border-radius:6px;text-decoration:none\">Reject</a></td></tr>').join('');\n" +
"const title = (p.reminder ? 'Reminder: ' : '') + n + ' Njia data change' + (n === 1 ? '' : 's') + ' waiting for your approval';\n" +
"const html = '<div style=\"font-family:system-ui;max-width:640px\"><h2>' + esc(title) + '</h2><p>Run ' + esc(p.runId) + '. Nothing goes live until you approve it. Open the <a href=\"' + s.adminUrl + '\">admin page</a> to see the full before/after and the source quote.</p><table style=\"border-collapse:collapse;width:100%\">' + rows + '</table><p style=\"color:#777;font-size:12px\">Njia editorial pipeline · links are single-use</p></div>';\n" +
"const oneLine = (t) => String(t || '').replace(/[\\r\\n\\t]+/g, ' ').replace(/ {2,}/g, ' ').trim();\n" +
"const wa = items.slice(0, 5).map(it => oneLine(it.targetCollection + '/' + it.targetId + ': ' + String(it.summary || '').slice(0, 80))).join(' · ') + (items.length > 5 ? ' · +' + (items.length - 5) + ' more' : '');\n" +
"return [{ json: { subject: title, html, waCount: String(n), waSummary: oneLine(wa || 'see e-mail').slice(0, 900), waLink: s.adminUrl, recipientEmail: s.reviewerEmail, recipientPhone: s.reviewerPhone, waPhoneNumberId: s.waPhoneNumberId } }];" },
    position: [1040, 300]
  },
  output: [{ subject: '2 changes', html: '<p>..</p>', waCount: '2', waSummary: '- ...', waLink: 'https://', recipientEmail: 'a@b.c', recipientPhone: '49', waPhoneNumberId: '1' }]
});

const sendEmail = node({
  type: 'n8n-nodes-base.gmail',
  version: 2.2,
  config: {
    name: 'Send E-mail',
    onError: 'continueRegularOutput',
    parameters: { resource: 'message', operation: 'send', sendTo: expr('{{ $json.recipientEmail }}'), subject: expr('{{ $json.subject }}'), emailType: 'html', message: expr('{{ $json.html }}'), options: { appendAttribution: false, senderName: 'Njia editorial' } },
    credentials: { gmailOAuth2: newCredential('Njia Gmail') },
    position: [1300, 200]
  },
  output: [{ id: 'msg' }]
});

const sendWhatsApp = node({
  type: 'n8n-nodes-base.whatsApp',
  version: 1.1,
  config: {
    name: 'Send WhatsApp',
    onError: 'continueRegularOutput',
    parameters: {
      resource: 'message', operation: 'sendTemplate',
      phoneNumberId: expr('{{ $json.waPhoneNumberId }}'),
      recipientPhoneNumber: expr('{{ $json.recipientPhone }}'),
      template: 'njia_review_needed|en',
      components: { component: [{ type: 'body', bodyParameters: { parameter: [
        { type: 'text', text: expr('{{ $json.waCount }}') },
        { type: 'text', text: expr('{{ $json.waSummary }}') },
        { type: 'text', text: expr('{{ $json.waLink }}') }
      ] } }] }
    },
    credentials: { whatsAppApi: { id: 'ARYhY3vv8xaEfZSC', name: 'WhatsApp account' } },
    position: [1300, 420]
  },
  output: [{ messages: [{ id: 'wamid' }] }]
});

export default workflow('njia-2-notify-reviewer', 'Njia 2 - Notify reviewer')
  .add(fromSourceCheck).to(settings).to(buildMessages).to(sendEmail)
  .add(buildMessages).to(sendWhatsApp)
  .add(weeklyReminder).to(settingsReminder).to(readPending).to(buildReminder).to(buildMessages)
  .add(sticky('## Njia 2 - Notify reviewer\n\nCalled by **Njia 1** after each 14-day source check, and runs itself every Monday 09:00 as a reminder while change requests are still pending.\n\n**Settings** (both nodes): project ID and URLs are in the code; reviewer e-mail, WhatsApp number and WhatsApp sender ID are filled in n8n only (public repo).\n\n**Firestore**: credential "Google Firebase Cloud Firestore account 3" (service account n8n-firestore@keepa-lean). Give that service account the role *Cloud Datastore User* on the Njia Firebase project, or create a new Google service-account credential for Njia and select it in all Firestore nodes.\n\n**E-mail**: create a Gmail OAuth2 credential "Njia Gmail" (any Google account), the approve/reject buttons link to the Cloud Function `review`.\n\n**WhatsApp**: template `njia_review_needed` (English, 3 body variables: count, summary, link) (Utility, English, 3 body variables: count, one-line summary, link). WhatsApp rejects line breaks inside variables, so the summary is joined with \" · \". Until Meta approves it, only the e-mail arrives.', [fromSourceCheck, weeklyReminder], { color: 4 }));

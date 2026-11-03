import { workflow, node, trigger, sticky, ifElse, splitInBatches, nextBatch, expr } from '@n8n/workflow-sdk';

const FS_CRED = { googleApi: { id: 'VVUOOS1FNgA7B8Bn', name: 'Google Firebase Cloud Firestore account 3' } };
const PROJECT = expr("{{ $('Settings').first().json.projectId }}");

const every14Days = trigger({
  type: 'n8n-nodes-base.scheduleTrigger',
  version: 1.3,
  config: { name: 'Every 14 days, Monday 06:00', parameters: { rule: { interval: [{ field: 'weeks', weeksInterval: 2, triggerAtDay: [1], triggerAtHour: 6, triggerAtMinute: 0 }] } }, position: [0, 200] },
  output: [{}]
});

const runManually = trigger({
  type: 'n8n-nodes-base.manualTrigger',
  version: 1,
  config: { name: 'Run manually', position: [0, 420] },
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
      includeOtherFields: false,
      assignments: { assignments: [
        { id: 'projectId', name: 'projectId', value: 'njia-prod', type: 'string' },
        { id: 'reviewBaseUrl', name: 'reviewBaseUrl', value: 'https://europe-west1-njia-prod.cloudfunctions.net/review', type: 'string' },
        { id: 'claudeModel', name: 'claudeModel', value: 'claude-sonnet-5-5', type: 'string' },
        { id: 'maxSources', name: 'maxSources', value: 80, type: 'number' },
        { id: 'forceAll', name: 'forceAll', value: false, type: 'boolean' },
        { id: 'startedAt', name: 'startedAt', value: expr('{{ $now.toUTC().toISO() }}'), type: 'string' },
        { id: 'status', name: 'status', value: 'running', type: 'string' },
        { id: 'sourcesChecked', name: 'sourcesChecked', value: 0, type: 'number' },
        { id: 'sourcesChanged', name: 'sourcesChanged', value: 0, type: 'number' },
        { id: 'sourcesFailed', name: 'sourcesFailed', value: 0, type: 'number' }
      ] }
    },
    position: [260, 300]
  },
  output: [{ projectId: 'njia-prod', claudeModel: 'claude-sonnet-5-5', maxSources: 80, forceAll: false, startedAt: '2026-11-02T06:00:00Z', status: 'running', sourcesChecked: 0, sourcesChanged: 0, sourcesFailed: 0 }]
});

const createRun = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Create Run',
    executeOnce: true,
    parameters: { resource: 'document', operation: 'create', authentication: 'serviceAccount', projectId: PROJECT, collection: 'refreshRuns', columns: 'startedAt,status,sourcesChecked,sourcesChanged,sourcesFailed', simple: true },
    credentials: FS_CRED,
    position: [520, 300]
  },
  output: [{ _id: 'run123', startedAt: '2026-11-02T06:00:00Z', status: 'running' }]
});

const readSources = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Read Sources',
    executeOnce: true,
    parameters: { resource: 'document', operation: 'query', authentication: 'serviceAccount', projectId: PROJECT, query: '{"structuredQuery":{"from":[{"collectionId":"sources"}],"where":{"fieldFilter":{"field":{"fieldPath":"active"},"op":"EQUAL","value":{"booleanValue":true}}},"limit":200}}', simple: true },
    credentials: FS_CRED,
    position: [780, 300]
  },
  output: [{ _id: 'uk-gov-student-visa', url: 'https://www.gov.uk/student-visa', extractor: 'claude_schema', cadenceDays: 14, lastHash: null, lastCheckedAt: null, targets: [{ collection: 'residencePermits', docId: 'GB-student', fields: ['fee'] }] }]
});

const filterDue = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Filter Due Sources',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const s = $('Settings').first().json;\n" +
"const now = Date.now();\n" +
"const out = [];\n" +
"for (const it of $input.all()) {\n" +
"  const r = it.json;\n" +
"  if (!r || !r._id || !r.url) continue;\n" +
"  if (r.extractor === 'api' || r.extractor === 'manual') continue; // api: Njia 3; manual: site blocks bots, reviewer checks by hand\n" +
"  const cadence = Number(r.cadenceDays || 14);\n" +
"  const last = r.lastCheckedAt ? Date.parse(r.lastCheckedAt) : 0;\n" +
"  const due = s.forceAll || !last || (now - last) >= cadence * 864e5 - 36e5;\n" +
"  if (!due) continue;\n" +
"  const targets = Array.isArray(r.targets) ? r.targets : [];\n" +
"  out.push({ json: { sourceId: r._id, name: r.name || r._id, url: r.url, extractor: r.extractor || 'html_diff', selector: r.selector || null, lastHash: r.lastHash || null, targets, firstTarget: targets[0] || null } });\n" +
"}\n" +
"return out.slice(0, Number(s.maxSources || 80));" },
    position: [1040, 300]
  },
  output: [{ sourceId: 'uk-gov-student-visa', name: 'GOV.UK', url: 'https://www.gov.uk/student-visa', extractor: 'claude_schema', selector: null, lastHash: null, targets: [], firstTarget: { collection: 'residencePermits', docId: 'GB-student', fields: ['fee'] } }]
});

const loop = splitInBatches({ version: 3, config: { name: 'Loop Sources', parameters: { batchSize: 1 }, position: [1300, 300] } });

const fetchPage = node({
  type: 'n8n-nodes-base.httpRequest',
  version: 4.4,
  config: {
    name: 'Fetch Page',
    onError: 'continueRegularOutput',
    parameters: {
      method: 'GET', url: expr('{{ $json.url }}'),
      sendHeaders: true, specifyHeaders: 'keypair',
      headerParameters: { parameters: [{ name: 'User-Agent', value: 'NjiaBot/1.0 (+https://njia.app; editorial change detection)' }, { name: 'Accept', value: 'text/html,application/xhtml+xml' }] },
      options: { timeout: 30000, redirect: { redirect: { followRedirects: true, maxRedirects: 5 } }, response: { response: { neverError: true, responseFormat: 'text', outputPropertyName: 'data', fullResponse: true } } }
    },
    position: [1560, 200]
  },
  output: [{ statusCode: 200, body: '<html>...</html>', headers: {} }]
});

const decide = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Compare With Last Check',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const src = $('Loop Sources').first().json;\n" +
"const res = $input.first().json || {};\n" +
"const status = Number(res.statusCode || 0);\n" +
"let html = typeof res.body === 'string' ? res.body : (typeof res.data === 'string' ? res.data : '');\n" +
"const fetchedAt = new Date().toISOString();\n" +
"const strip = (h) => h.replace(/<script[\\s\\S]*?<\\/script>/gi, ' ').replace(/<style[\\s\\S]*?<\\/style>/gi, ' ').replace(/<!--[\\s\\S]*?-->/g, ' ').replace(/<[^>]+>/g, ' ').replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/&#39;|&apos;/g, \"'\").replace(/&quot;/g, '\"').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/\\s+/g, ' ').trim();\n" +
"const fnv = (t) => { let h = 0x811c9dc5; for (let i = 0; i < t.length; i++) { h ^= t.charCodeAt(i); h = Math.imul(h, 0x01000193) >>> 0; } return h.toString(16).padStart(8, '0') + '-' + t.length; };\n" +
"if (res.error || !status || status >= 400 || !html) {\n" +
"  return [{ json: { ...src, action: 'skip', fetchStatus: 'error', httpStatus: status, newHash: src.lastHash, fetchedAt, text: '', error: res.error ? String(res.error.message || res.error) : ('HTTP ' + status) } }];\n" +
"}\n" +
"let region = html;\n" +
"if (src.selector) { const id = String(src.selector).replace(/^#/, ''); const m = html.match(new RegExp('id=[\"\\']' + id + '[\"\\'][^>]*>([\\\\s\\\\S]*?)<\\\\/(main|section|article|div)>', 'i')); if (m) region = m[1]; }\n" +
"const text = strip(region).slice(0, 60000);\n" +
"const newHash = fnv(text);\n" +
"const firstRun = !src.lastHash;\n" +
"const changed = !firstRun && newHash !== src.lastHash;\n" +
"const canExtract = src.extractor === 'claude_schema' && src.firstTarget && src.firstTarget.docId && src.firstTarget.docId !== '*';\n" +
"const action = changed ? (canExtract ? 'extract' : 'note') : 'skip';\n" +
"return [{ json: { ...src, action, fetchStatus: changed ? 'changed' : 'ok', httpStatus: status, newHash, fetchedAt, firstRun, text: action === 'extract' ? text : text.slice(0, 2000), error: null } }];" },
    position: [1820, 200]
  },
  output: [{ sourceId: 'x', action: 'extract', fetchStatus: 'changed', newHash: 'abc-123', fetchedAt: '2026-11-02T06:01:00Z', firstRun: false, text: 'page text', firstTarget: { collection: 'residencePermits', docId: 'GB-student', fields: ['fee'] }, lastHash: 'old', url: 'https://' }]
});

const needsClaude = ifElse({
  version: 2.3,
  config: { name: 'Needs Extraction?', parameters: { conditions: { options: { caseSensitive: true, leftValue: '', typeValidation: 'strict', version: 2 }, conditions: [{ leftValue: expr('{{ $json.action }}'), rightValue: 'extract', operator: { type: 'string', operation: 'equals' } }], combinator: 'and' } }, position: [2080, 200] }
});

const getTarget = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Get Target Document',
    onError: 'continueRegularOutput',
    alwaysOutputData: true,
    parameters: { resource: 'document', operation: 'get', authentication: 'serviceAccount', projectId: PROJECT, collection: expr('{{ $json.firstTarget.collection }}'), documentId: expr('{{ $json.firstTarget.docId }}'), simple: true },
    credentials: FS_CRED,
    position: [2340, 100]
  },
  output: [{ _id: 'GB-student', fee: { amount: 524, currency: 'GBP', period: 'once' }, provenance: {} }]
});

const buildClaudeRequest = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Extraction Request',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const s = $('Settings').first().json;\n" +
"const d = $('Compare With Last Check').first().json;\n" +
"const doc = ($input.first() && $input.first().json) || {};\n" +
"const t = d.firstTarget || {};\n" +
"const fields = Array.isArray(t.fields) && t.fields.length && t.fields[0] !== '*' ? t.fields : Object.keys(doc).filter(k => !k.startsWith('_') && k !== 'provenance');\n" +
"const current = {}; for (const f of fields) current[f] = doc[f] === undefined ? null : doc[f];\n" +
"const system = 'You are the data editor of Njia, a career-planning app for students from Sierra Leone. You compare an official web page with the current values stored in our database and propose corrections. Rules: propose a change ONLY when the page states a different value clearly; every change needs a verbatim quote (max 300 characters) copied from the page text; never invent numbers; keep the exact JSON shape of the current value (money = {amount, currency, period}; processingWeeks = {min, max}); if the page no longer covers the topic, set pageStillRelevant=false and propose nothing. Reply with JSON only: {\"summary\": string, \"pageStillRelevant\": boolean, \"changes\": [{\"path\": string (one of the editable fields, dot-notation allowed), \"from\": any, \"to\": any, \"quote\": string, \"confidence\": number 0-1}]}';\n" +
"const user = 'Source: ' + d.name + ' (' + d.url + ')\\nTarget document: ' + t.collection + '/' + t.docId + '\\nEditable fields: ' + JSON.stringify(fields) + '\\nCurrent values: ' + JSON.stringify(current) + '\\n\\nPage text (fetched ' + d.fetchedAt + '):\\n' + String(d.text || '').slice(0, 50000);\n" +
"const body = { model: s.claudeModel, max_tokens: 2000, temperature: 0, system, messages: [{ role: 'user', content: user }] };\n" +
"return [{ json: { requestBody: JSON.stringify(body), fields, current } }];" },
    position: [2600, 100]
  },
  output: [{ requestBody: '{}', fields: ['fee'], current: { fee: {} } }]
});

const askClaude = node({
  type: 'n8n-nodes-base.httpRequest',
  version: 4.4,
  config: {
    name: 'Ask Claude',
    retryOnFail: true,
    onError: 'continueRegularOutput',
    parameters: {
      method: 'POST', url: 'https://api.anthropic.com/v1/messages',
      authentication: 'genericCredentialType', genericAuthType: 'httpHeaderAuth',
      sendHeaders: true, specifyHeaders: 'keypair', headerParameters: { parameters: [{ name: 'anthropic-version', value: '2023-06-01' }, { name: 'content-type', value: 'application/json' }] },
      sendBody: true, contentType: 'json', specifyBody: 'json', jsonBody: expr('{{ $json.requestBody }}'),
      options: { timeout: 120000 }
    },
    credentials: { httpHeaderAuth: { id: 'y9xMQSNKh8g2aoAd', name: 'Claude Header Auth account' } },
    position: [2860, 100]
  },
  output: [{ content: [{ type: 'text', text: '{"summary":"fee changed","pageStillRelevant":true,"changes":[]}' }] }]
});

const buildChangeRequest = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Change Request',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const d = $('Compare With Last Check').first().json;\n" +
"const req = $('Build Extraction Request').first().json;\n" +
"const runId = $('Create Run').first().json._id;\n" +
"const res = $input.first().json || {};\n" +
"const t = d.firstTarget || {};\n" +
"let parsed = null, err = null;\n" +
"try {\n" +
"  if (res.error || res.type === 'error') throw new Error('Claude error: ' + JSON.stringify(res.error || res));\n" +
"  const txt = (res.content || []).filter(b => b.type === 'text').map(b => b.text).join('\\n');\n" +
"  const a = txt.indexOf('{'), b = txt.lastIndexOf('}');\n" +
"  parsed = JSON.parse(txt.slice(a, b + 1));\n" +
"} catch (e) { err = String(e.message || e); }\n" +
"const rand = () => { try { return require('crypto').randomBytes(24).toString('hex'); } catch (e) { let o = ''; for (let i = 0; i < 48; i++) o += Math.floor(Math.random() * 16).toString(16); return o; } };\n" +
"const changes = (parsed && Array.isArray(parsed.changes) ? parsed.changes : []).filter(c => c && c.path && c.quote && (req.fields || []).some(f => String(c.path).split('.')[0] === f));\n" +
"const setPath = (obj, path, val) => { const ks = path.split('.'); let o = obj; for (let i = 0; i < ks.length - 1; i++) { if (typeof o[ks[i]] !== 'object' || o[ks[i]] === null) o[ks[i]] = {}; o = o[ks[i]]; } o[ks[ks.length - 1]] = val; };\n" +
"if (err || !changes.length) {\n" +
"  return [{ json: { write: false, extractionError: err, summary: parsed ? parsed.summary : null, pageStillRelevant: parsed ? parsed.pageStillRelevant !== false : true } }];\n" +
"}\n" +
"const after = JSON.parse(JSON.stringify(req.current || {}));\n" +
"for (const c of changes) setPath(after, c.path, c.to);\n" +
"const quote = changes.map(c => c.quote).join(' | ').slice(0, 900);\n" +
"const confidence = Math.min(...changes.map(c => Number(c.confidence || 0.5)));\n" +
"const crId = 'cr-' + d.sourceId + '-' + Date.now().toString(36);\n" +
"return [{ json: { write: true, crId, runId, targetCollection: t.collection, targetId: t.docId, op: 'update', before: req.current || {}, after, diff: changes.map(c => ({ path: c.path, from: c.from === undefined ? null : c.from, to: c.to })), sourceId: d.sourceId, evidence: { url: d.url, quote, fetchedAt: d.fetchedAt }, extractedBy: $('Settings').first().json.claudeModel, confidence, status: 'pending', approvalToken: rand(), createdAt: new Date().toISOString(), appliedAt: null, error: null, summary: parsed.summary || '' } }];" },
    position: [3120, 100]
  },
  output: [{ write: true, crId: 'cr-x-1', runId: 'run123', targetCollection: 'residencePermits', targetId: 'GB-student', op: 'update', before: {}, after: {}, diff: [], sourceId: 'x', evidence: {}, extractedBy: 'claude', confidence: 0.9, status: 'pending', approvalToken: 'tok', createdAt: '2026-11-02T06:02:00Z', appliedAt: null, error: null, summary: '' }]
});

const buildNote = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Page-Changed Note',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const d = $input.first().json;\n" +
"if (d.action !== 'note') return [{ json: { write: false } }];\n" +
"const runId = $('Create Run').first().json._id;\n" +
"const rand = () => { try { return require('crypto').randomBytes(24).toString('hex'); } catch (e) { let o = ''; for (let i = 0; i < 48; i++) o += Math.floor(Math.random() * 16).toString(16); return o; } };\n" +
"const t = d.firstTarget || { collection: 'sources', docId: d.sourceId };\n" +
"const crId = 'cr-' + d.sourceId + '-' + Date.now().toString(36);\n" +
"return [{ json: { write: true, crId, runId, targetCollection: t.collection, targetId: t.docId === '*' ? d.sourceId : t.docId, op: 'update', before: {}, after: {}, diff: [{ path: '(page)', from: d.lastHash, to: d.newHash }], sourceId: d.sourceId, evidence: { url: d.url, quote: 'Page content changed; no automatic extraction for this source. Please check manually: ' + String(d.text || '').slice(0, 400), fetchedAt: d.fetchedAt }, extractedBy: 'html_diff', confidence: 0.3, status: 'pending', approvalToken: rand(), createdAt: new Date().toISOString(), appliedAt: null, error: null, summary: 'Page changed' } }];" },
    position: [2340, 420]
  },
  output: [{ write: false }]
});

const shouldWrite = ifElse({
  version: 2.3,
  config: { name: 'Write Change Request?', parameters: { conditions: { options: { caseSensitive: true, leftValue: '', typeValidation: 'strict', version: 2 }, conditions: [{ leftValue: expr('{{ $json.write }}'), rightValue: true, operator: { type: 'boolean', operation: 'true', singleValue: true } }], combinator: 'and' } }, position: [3380, 300] }
});

const writeChangeRequest = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Write Change Request',
    onError: 'continueRegularOutput',
    parameters: { resource: 'document', operation: 'create', authentication: 'serviceAccount', projectId: PROJECT, collection: 'changeRequests', documentId: expr('{{ $json.crId }}'), columns: 'runId,targetCollection,targetId,op,before,after,diff,sourceId,evidence,extractedBy,confidence,status,approvalToken,createdAt,appliedAt,error,summary', simple: true },
    credentials: FS_CRED,
    position: [3640, 200]
  },
  output: [{ _id: 'cr-x-1' }]
});

const buildSourceUpdate = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Source Update',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const d = $('Compare With Last Check').first().json;\n" +
"const st = d.fetchStatus === 'error' ? 'error' : (d.fetchStatus === 'changed' ? 'changed' : 'ok');\n" +
"return [{ json: { docId: d.sourceId, lastHash: d.newHash || null, lastCheckedAt: d.fetchedAt, lastFetchedAt: st === 'error' ? null : d.fetchedAt, lastStatus: st, lastError: d.error || null } }];" },
    position: [3900, 300]
  },
  output: [{ docId: 'x', lastHash: 'abc', lastCheckedAt: '2026-11-02T06:02:00Z', lastFetchedAt: '2026-11-02T06:02:00Z', lastStatus: 'ok', lastError: null }]
});

const updateSource = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Update Source',
    onError: 'continueRegularOutput',
    parameters: { resource: 'document', operation: 'upsert', authentication: 'serviceAccount', projectId: PROJECT, collection: 'sources', updateKey: 'docId', columns: 'lastHash,lastCheckedAt,lastFetchedAt,lastStatus,lastError' },
    credentials: FS_CRED,
    position: [4160, 300]
  },
  output: [{ updateTime: '2026-11-02T06:02:01Z' }]
});

const readRunChanges = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Read Run Change Requests',
    executeOnce: true,
    alwaysOutputData: true,
    onError: 'continueRegularOutput',
    parameters: { resource: 'document', operation: 'query', authentication: 'serviceAccount', projectId: PROJECT, query: expr('{"structuredQuery":{"from":[{"collectionId":"changeRequests"}],"where":{"fieldFilter":{"field":{"fieldPath":"runId"},"op":"EQUAL","value":{"stringValue":"{{ $(\'Create Run\').first().json._id }}"}}},"limit":200}}'), simple: true },
    credentials: FS_CRED,
    position: [1560, 520]
  },
  output: [{ _id: 'cr-x-1', targetCollection: 'residencePermits', targetId: 'GB-student', diff: [], approvalToken: 'tok', status: 'pending' }]
});

const summarize = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Summarize Run',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const run = $('Create Run').first().json;\n" +
"const allRuns = (name) => { const out = []; for (let r = 0; r < 5000; r++) { let items; try { items = $(name).all(0, r); } catch (e) { break; } if (!items || !items.length) break; out.push(...items.map(i => i.json)); } return out; };\n" +
"const checks = allRuns('Build Source Update');\n" +
"const crs = $input.all().map(i => i.json).filter(j => j && j._id && j.status === 'pending');\n" +
"const items = crs.map(c => ({ id: c._id, targetCollection: c.targetCollection, targetId: c.targetId, summary: (c.diff || []).map(d => d.path + ': ' + JSON.stringify(d.from) + ' -> ' + JSON.stringify(d.to)).join('; ').slice(0, 300), approvalToken: c.approvalToken }));\n" +
"return [{ json: { docId: run._id, runId: run._id, finishedAt: new Date().toISOString(), status: 'done', sourcesChecked: checks.length, sourcesChanged: checks.filter(c => c.lastStatus === 'changed').length, sourcesFailed: checks.filter(c => c.lastStatus === 'error').length, changeRequestIds: crs.map(c => c._id), pendingCount: crs.length, items } }];" },
    position: [1820, 520]
  },
  output: [{ docId: 'run123', runId: 'run123', finishedAt: '2026-11-02T06:10:00Z', status: 'done', sourcesChecked: 30, sourcesChanged: 2, sourcesFailed: 0, changeRequestIds: [], pendingCount: 2, items: [] }]
});

const updateRun = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Update Run',
    onError: 'continueRegularOutput',
    parameters: { resource: 'document', operation: 'upsert', authentication: 'serviceAccount', projectId: PROJECT, collection: 'refreshRuns', updateKey: 'docId', columns: 'finishedAt,status,sourcesChecked,sourcesChanged,sourcesFailed,changeRequestIds' },
    credentials: FS_CRED,
    position: [2080, 520]
  },
  output: [{ updateTime: '2026-11-02T06:10:01Z' }]
});

const anyChanges = ifElse({
  version: 2.3,
  config: { name: 'Any Changes To Review?', parameters: { conditions: { options: { caseSensitive: true, leftValue: '', typeValidation: 'strict', version: 2 }, conditions: [{ leftValue: expr("{{ $('Summarize Run').first().json.pendingCount }}"), rightValue: 0, operator: { type: 'number', operation: 'gt' } }], combinator: 'and' } }, position: [2080, 520] }
});

const buildNotifyPayload = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Notify Payload',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const r = $('Summarize Run').first().json;\n" +
"const base = $('Settings').first().json.reviewBaseUrl || '';\n" +
"const items = (r.items || []).map(it => ({ ...it, approveUrl: base + '?id=' + it.id + '&d=approve&t=' + it.approvalToken, rejectUrl: base + '?id=' + it.id + '&d=reject&t=' + it.approvalToken }));\n" +
"return [{ json: { runId: r.runId, pendingCount: r.pendingCount, items } }];" },
    position: [2340, 520]
  },
  output: [{ runId: 'run123', pendingCount: 2, items: [] }]
});

const notify = node({
  type: 'n8n-nodes-base.executeWorkflow',
  version: 1.3,
  config: {
    name: 'Notify Reviewer (Njia 2)',
    parameters: { source: 'database', workflowId: { __rl: true, mode: 'id', value: 'lgUfq7EKOUPUZ9Dv' }, workflowInputs: { mappingMode: 'passThrough', value: null }, mode: 'once', options: { waitForSubWorkflow: false } },
    position: [2600, 520]
  },
  output: [{}]
});

export default workflow('njia-1-source-check', 'Njia 1 - Source check (every 14 days)')
  .add(every14Days).to(settings)
  .add(runManually).to(settings)
  .add(settings).to(createRun).to(readSources).to(filterDue)
  .to(loop
    .onDone(readRunChanges.to(summarize).to(updateRun).to(anyChanges.onTrue(buildNotifyPayload.to(notify))))
    .onEachBatch(fetchPage.to(decide).to(needsClaude
      .onTrue(getTarget.to(buildClaudeRequest).to(askClaude).to(buildChangeRequest).to(shouldWrite
        .onTrue(writeChangeRequest.to(buildSourceUpdate))
        .onFalse(buildSourceUpdate)))
      .onFalse(buildNote.to(shouldWrite))))
  )
  .add(buildSourceUpdate).to(updateSource).to(nextBatch(loop))
  .add(sticky('## Njia 1 - Source check\n\nRuns every second Monday 06:00 (and manually). For every active source in Firestore `sources` that is due (cadenceDays): fetch the page, strip it to text, compare a hash with the last run. If the page changed and the source is marked `claude_schema`, the current target document plus the page text go to Claude, which proposes field changes with verbatim quotes. Proposals land in `changeRequests` (status pending) and **nothing goes live** until a person approves them (e-mail/WhatsApp via Njia 2, or the admin page). The Cloud Function `onChangeRequestWritten` applies approved changes and keeps history.\n\n**First run** only stores hashes (no proposals). Set `forceAll` in Settings to check every source regardless of cadence.\n\n**Credentials**: Firestore = "Google Firebase Cloud Firestore account 3" (grant that service account *Cloud Datastore User* on the Njia project, or swap the credential). Claude = "Claude Header Auth account" (x-api-key).\n\n**Settings**: projectId, reviewBaseUrl (URL of the `review` Cloud Function, used in the approve/reject links), claudeModel, maxSources, forceAll.', [every14Days, runManually], { color: 4 }));

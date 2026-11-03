import { workflow, node, trigger, sticky, newCredential, splitInBatches, nextBatch, expr, placeholder } from '@n8n/workflow-sdk';

const FS_CRED = { googleApi: { id: 'VVUOOS1FNgA7B8Bn', name: 'Google Firebase Cloud Firestore account 3' } };

const daily = trigger({
  type: 'n8n-nodes-base.scheduleTrigger',
  version: 1.3,
  config: { name: 'Every day 03:00', parameters: { rule: { interval: [{ field: 'days', daysInterval: 1, triggerAtHour: 3, triggerAtMinute: 0 }] } }, position: [0, 200] },
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
        { id: 'adzunaAppId', name: 'adzunaAppId', value: placeholder('Adzuna app_id (from developer.adzuna.com; the app_key goes into the credential)'), type: 'string' },
        { id: 'countries', name: 'countries', value: 'gb,de,nl,fr,it,at', type: 'string' },
        { id: 'queries', name: 'queries', value: 'graduate finance=isco-2413|junior financial analyst=isco-2413|junior accountant=isco-2411|junior software developer=isco-2512|credit analyst=isco-3312', type: 'string' },
        { id: 'resultsPerPage', name: 'resultsPerPage', value: 50, type: 'number' },
        { id: 'ttlDays', name: 'ttlDays', value: 30, type: 'number' }
      ] }
    },
    position: [260, 300]
  },
  output: [{ projectId: 'njia-prod', adzunaAppId: 'id', countries: 'gb,de', queries: 'graduate finance=isco-2413', resultsPerPage: 50, ttlDays: 30 }]
});

const buildRequests = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Build Requests',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const s = $input.first().json;\n" +
"const countries = String(s.countries || '').split(',').map(x => x.trim().toLowerCase()).filter(Boolean);\n" +
"const queries = String(s.queries || '').split('|').map(q => { const [what, occ] = q.split('='); return { what: (what || '').trim(), occupationId: (occ || '').trim() || null }; }).filter(q => q.what);\n" +
"const out = [];\n" +
"for (const c of countries) for (const q of queries) out.push({ json: { country: c, what: q.what, occupationId: q.occupationId } });\n" +
"return out;" },
    position: [520, 300]
  },
  output: [{ country: 'gb', what: 'graduate finance', occupationId: 'isco-2413' }]
});

const loop = splitInBatches({ version: 3, config: { name: 'Loop Requests', parameters: { batchSize: 1 }, position: [780, 300] } });

const search = node({
  type: 'n8n-nodes-base.httpRequest',
  version: 4.4,
  config: {
    name: 'Adzuna Search',
    onError: 'continueRegularOutput',
    parameters: {
      method: 'GET',
      url: expr('https://api.adzuna.com/v1/api/jobs/{{ $json.country }}/search/1'),
      authentication: 'genericCredentialType', genericAuthType: 'httpQueryAuth',
      sendQuery: true, specifyQuery: 'keypair',
      queryParameters: { parameters: [
        { name: 'app_id', value: expr("{{ $('Settings').first().json.adzunaAppId }}") },
        { name: 'what', value: expr('{{ $json.what }}') },
        { name: 'results_per_page', value: expr("{{ $('Settings').first().json.resultsPerPage }}") },
        { name: 'max_days_old', value: '14' },
        { name: 'content-type', value: 'application/json' }
      ] },
      options: { timeout: 30000, response: { response: { neverError: true } } }
    },
    credentials: { httpQueryAuth: newCredential('Adzuna app_key (query auth: name app_key)') },
    position: [1040, 200]
  },
  output: [{ results: [{ id: '123', title: 'Graduate Finance Analyst', company: { display_name: 'Bank' }, location: { display_name: 'London', area: ['UK', 'London'] }, salary_min: 30000, salary_max: 35000, salary_is_predicted: '0', redirect_url: 'https://', created: '2026-11-01T10:00:00Z', contract_time: 'full_time' }] }]
});

const mapJobs = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Map To Jobs',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode:
"const s = $('Settings').first().json;\n" +
"const req = $('Loop Requests').first().json;\n" +
"const res = $input.first().json || {};\n" +
"const results = Array.isArray(res.results) ? res.results : [];\n" +
"const cur = { gb: 'GBP', de: 'EUR', nl: 'EUR', fr: 'EUR', it: 'EUR', at: 'EUR', pl: 'PLN', us: 'USD', ca: 'CAD', au: 'AUD', za: 'ZAR' };\n" +
"const level = (t) => { const x = String(t).toLowerCase(); if (/intern|werkstudent|praktik/.test(x)) return 'internship'; if (/graduate|junior|trainee|entry|einstieg|absolvent/.test(x)) return 'entry'; if (/senior|lead|head|principal|manager|director/.test(x)) return 'senior'; return 'mid'; };\n" +
"const expire = new Date(Date.now() + Number(s.ttlDays || 30) * 864e5).toISOString();\n" +
"const out = [];\n" +
"for (const r of results) {\n" +
"  if (!r || !r.id || !r.title) continue;\n" +
"  const hasSalary = r.salary_min || r.salary_max;\n" +
"  out.push({ json: {\n" +
"    docId: 'adzuna-' + req.country + '-' + String(r.id),\n" +
"    title: String(r.title).replace(/<[^>]+>/g, '').slice(0, 200),\n" +
"    employer: r.company && r.company.display_name ? r.company.display_name : null,\n" +
"    countryId: req.country.toUpperCase(),\n" +
"    city: r.location && r.location.display_name ? r.location.display_name : null,\n" +
"    occupationId: req.occupationId,\n" +
"    level: level(r.title),\n" +
"    salary: hasSalary ? { min: Number(r.salary_min || r.salary_max), max: Number(r.salary_max || r.salary_min), currency: cur[req.country] || 'EUR', period: 'year' } : null,\n" +
"    salaryIsEstimate: String(r.salary_is_predicted) === '1' || !hasSalary,\n" +
"    contractTime: r.contract_time || null,\n" +
"    languageRequired: null,\n" +
"    visaSponsorship: 'unknown',\n" +
"    url: r.redirect_url || null,\n" +
"    source: 'adzuna',\n" +
"    query: req.what,\n" +
"    postedAt: r.created || new Date().toISOString(),\n" +
"    expireAt: expire,\n" +
"    importedAt: new Date().toISOString()\n" +
"  } });\n" +
"}\n" +
"return out;" },
    position: [1300, 200]
  },
  output: [{ docId: 'adzuna-gb-123', title: 'Graduate Finance Analyst', employer: 'Bank', countryId: 'GB', city: 'London', occupationId: 'isco-2413', level: 'entry', salary: { min: 30000, max: 35000, currency: 'GBP', period: 'year' }, salaryIsEstimate: false, contractTime: 'full_time', languageRequired: null, visaSponsorship: 'unknown', url: 'https://', source: 'adzuna', query: 'graduate finance', postedAt: '2026-11-01T10:00:00Z', expireAt: '2026-12-01T03:00:00Z', importedAt: '2026-11-02T03:00:00Z' }]
});

const upsertJobs = node({
  type: 'n8n-nodes-base.googleFirebaseCloudFirestore',
  version: 1.1,
  config: {
    name: 'Upsert Jobs',
    onError: 'continueRegularOutput',
    parameters: { resource: 'document', operation: 'upsert', authentication: 'serviceAccount', projectId: expr("{{ $('Settings').first().json.projectId }}"), collection: 'jobs', updateKey: 'docId', columns: 'title,employer,countryId,city,occupationId,level,salary,salaryIsEstimate,contractTime,languageRequired,visaSponsorship,url,source,query,postedAt,expireAt,importedAt' },
    credentials: FS_CRED,
    position: [1560, 200]
  },
  output: [{ updateTime: '2026-11-02T03:00:01Z' }]
});

const done = node({
  type: 'n8n-nodes-base.code',
  version: 2,
  config: {
    name: 'Done',
    parameters: { mode: 'runOnceForAllItems', language: 'javaScript', jsCode: "return [{ json: { finishedAt: new Date().toISOString() } }];" },
    position: [1040, 460]
  },
  output: [{ finishedAt: '2026-11-02T03:05:00Z' }]
});

export default workflow('njia-3-jobs-refresh', 'Njia 3 - Jobs refresh (daily)')
  .add(daily).to(settings)
  .add(runManually).to(settings)
  .add(settings).to(buildRequests)
  .to(loop
    .onDone(done)
    .onEachBatch(search.to(mapJobs).to(upsertJobs).to(nextBatch(loop)))
  )
  .add(sticky('## Njia 3 - Jobs refresh\n\nDaily 03:00: for each country x query in Settings, calls the Adzuna Jobs API (16 countries; of our ten, GB, DE, NL, FR, IT, AT are covered) and upserts the postings into Firestore `jobs`. Jobs are machine-sourced (trust: api) and need no human approval; each document carries `expireAt` so the Firestore TTL policy deletes it after 30 days.\n\n**Set up**: Adzuna developer account (free tier) -> put app_id in Settings and app_key into the query-auth credential (parameter name `app_key`). Firestore credential as in Njia 1.\n\n**Not covered by Adzuna**: Ireland, Hungary, Finland, Norway -> add partner feeds or employer career pages later. Do not scrape LinkedIn or Indeed.', [daily, runManually], { color: 4 }));

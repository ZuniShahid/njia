# Njia – career planner for students in Sierra Leone

Operator: Revana EOOD (Bulgaria). Start corridor: Sierra Leone → DE, GB, IE, NL, FR, IT, HU, FI, AT, NO.

Stack: Flutter (web, Android, iOS) · Firebase (Auth, Firestore, Cloud Functions, Storage, Hosting, region europe-west1) · n8n (editorial pipeline) · Claude (extraction).

```
schema/njia.schema.json      data model (JSON Schema) – every content doc carries `provenance`
seed/*.json                  135 verified/estimated start documents for SL → 10 countries
scripts/validate-seed.mjs    schema + referential-integrity check   (npm run validate)
scripts/seed-firestore.mjs   import seed into Firestore              (npm run seed)
firestore.rules / indexes    public read for content, owner-only users, editor-only queue
functions/src/engine.mjs     planning engine (readiness, difficulty, realism, roadmap) – pure JS, tested
functions/src/index.mjs      Cloud Functions: api, review, onChangeRequestWritten, onGoalWritten, computePlan, setRole
n8n/*.js                     the 3 n8n workflows as SDK code (already created in n8n.keevana.com)
app/prototype/njia.html      approved UI prototype (v8) – reference for the Flutter app
docs/                        architecture, setup, data model, plan (full planning doc), handover, prototype-notes
CLAUDE.md                    project memory for Claude Code sessions
```

New here? Read `docs/handover.md` first.

## Quick start

```bash
npm install && npm run validate && npm test        # schema + engine tests, no Firebase needed
npm i -g firebase-tools && firebase login
firebase use --add                                  # pick/create project njia-prod (region europe-west1)
firebase deploy --only firestore:rules,firestore:indexes,storage
GOOGLE_APPLICATION_CREDENTIALS=sa.json npm run seed # import seed (idempotent)
cd functions && npm install && cd .. && firebase deploy --only functions
```

Then follow `docs/setup.md` for n8n, Adzuna, WhatsApp template and the reviewer.

## Principles

1. Nothing about visas, recognition or money goes live without a human approval (`changeRequests` queue).
2. Every fact shows its source, fetch date and trust level in the UI.
3. Users never pay for job placement; the fit ranking is never for sale (neutrality rules in the planning doc).
4. Jobs come from APIs and partner feeds, never from scraping LinkedIn/Indeed.

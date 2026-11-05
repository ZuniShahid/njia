# Njia – project memory for Claude Code

Read this first, then `docs/handover.md` (full state and next tasks), then the file the task points at.

## What Njia is
Career-planning app for students in Sierra Leone who want to study or work in Europe. A student sets a goal
(e.g. "Head of Department at a bank in Frankfurt by 2032"), the app computes readiness/difficulty/realism and a
year-by-year roadmap, and shows the facts behind every step: requirements, visa/residence rules, funding, jobs –
each fact with its source, fetch date and trust level. Operator: Revana EOOD (Bulgaria). Brand "Njia", store name
"Njia Careers". Owner: Philipp Leitlein (product), Zunair (ZuniShahid, lead developer).

## Non-negotiable rules
1. Nothing about visas, recognition or money goes live without human approval (`changeRequests` queue, n8n → reviewer → Cloud Function).
2. Every content number shown in the UI carries provenance (`ProvenanceChip`: "Checked 2 Nov 2026 · source" or "Estimate · to verify"). Never invent facts; keep `trust: "estimate"` until verified.
3. Students never pay for job placement; the fit ranking is never for sale; paid placements (later) are labelled "Ad".
4. Jobs come from APIs/partner feeds (Adzuna, Bundesagentur), never from scraping LinkedIn/Indeed.
5. Coach guides, never ghostwrites (no letters/essays written for the student).
6. Keep in-app copy short and direct. English UI. Works offline-first on poor connections.

## Stack and layout
Flutter (web + Android + iOS, one codebase) · Firebase project `njia-prod`, region europe-west1 (Auth, Firestore,
Cloud Functions v2 Node 22 ESM, Storage, Hosting) · n8n at n8n.keevana.com for the editorial pipeline · Claude API
for extraction (Sonnet) and coach chat (Sonnet, `COACH_MODEL`), always called from Cloud Functions, never from the client.

```
schema/njia.schema.json       canonical data model (JSON Schema) – generate Dart models from it
seed/*.json                   135 start docs (SL → DE GB IE NL FR IT HU FI AT NO) – npm run validate
functions/src/engine.mjs      planning engine (pure JS, tested) – Dart port in app/lib/core/engine (parity test), keep in sync
functions/src/index.mjs       api · review · onChangeRequestWritten · onGoalWritten · computePlan · setRole · coach · deleteAccount
functions/src/coach.mjs       coach prompt, context with provenance, daily limit (10/day) – tested in functions/test/coach.test.mjs
firestore.rules/indexes       public read content, owner-only users, editor-only queue, TTL on jobs.expireAt
n8n/*.js                      the 3 workflows as n8n SDK code (already created in n8n, inactive)
app/prototype/njia.html       the approved UI prototype (v8) – the visual and behavioural reference for the Flutter app
app/                          Flutter app, all prototype views built (app/README.md) – models generated via npm run gen:models
app/lib/main_preview.dart     app with sample data and no Firebase (flutter run -t lib/main_preview.dart -d chrome)
docs/                         architecture · setup · data-model · plan (full planning doc, German) · handover · prototype-notes
docs/release/                 Play Store kit (play-store.md) and Android signing (android-signing.md)
app/web/privacy, delete-account  public pages for the stores, served by Hosting (njia.keevana.com/privacy/, /delete-account/)
```

## Commands
```
npm install && npm run validate && npm test      # schema + referential checks, engine tests (no Firebase needed)
cd app && flutter pub get && flutter test        # Dart engine port, model round-trips, app smoke test
firebase emulators:start                         # local Firestore/Functions/Auth
```

## Conventions
- Firestore collection and field names exactly as in `schema/njia.schema.json` (camelCase, ISO 3166 country codes, ISO 4217 currencies, CEFR levels, ESCO/ISCO occupations).
- Server plan (`users/{uid}/plans/{goalId}`) is canonical; the Dart engine port is for offline/instant preview only.
- UI tokens, spacing, copy and screen structure come from `app/prototype/njia.html` (see `docs/prototype-notes.md`); do not redesign, port.
- Commit messages: short imperative English. Don't commit `sa.json`, keys, or `node_modules`.
- Work on a feature branch and open a PR to `main`. Branch `web-build` only carries the release web build (`app/build/web`, force-added) on top of `main`; never merge it into `main`.
- After `schema/njia.schema.json` changes: `npm run validate && npm run gen:models && (cd app && dart run build_runner build --delete-conflicting-outputs)`. After `functions/src/engine.mjs` changes: port to Dart and `npm run engine:fixture`.
- When unsure about a fact (fee, deadline, rule): keep it, mark `trust: "estimate"`, add it to the review queue – don't delete and don't guess.

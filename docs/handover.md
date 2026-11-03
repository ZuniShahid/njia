# Handover – state on 3 November 2026

Written for whoever (human or Claude Code session) picks this repo up without the original chat history.
Everything decided so far is here or in the linked files. German planning doc: `docs/plan.md`.

## 1. Decisions already taken (do not reopen)

| Topic | Decision |
| --- | --- |
| Product | Career planner for students in Sierra Leone → Europe. Core free; monetisation deferred, neutrality rules apply from day 1 (`docs/plan.md` → Monetarisierung). |
| Name | Brand **Njia** (Swahili "path"), store listing **"Njia Careers"** (bare "Njia" is taken by a Bible app). Trademark + domain check still open (candidates njia.africa, njia.app, getnjia.com). |
| Corridor | Origin Sierra Leone; destinations DE, GB, IE, NL, FR, IT, HU, FI, AT, NO (reasoning per country in `docs/plan.md`). |
| Operator | Revana EOOD, Bulgaria. Data + hosting in the EU (Firebase europe-west1). |
| Stack | Flutter (web/Android/iOS) · Firebase (Auth, Firestore, Functions, Storage, Hosting) · n8n (self-hosted, n8n.keevana.com) · Anthropic API (OpenAI only if clearly cheaper for same quality). |
| Data refresh | Every 14 days automatically (n8n), each change goes to one reviewer by e-mail **and** WhatsApp; nothing goes live without approval. Jobs daily via Adzuna. |
| Scale | Few hundred users at start. Cost estimate ≈ €15–40/month tech (`docs/plan.md` → Laufende Kosten). |
| UI | The HTML prototype is the approved reference (`app/prototype/njia.html`, published at https://claude.ai/artifact/X1ZHUwPKPKV7CEtbBizSMZ). Flutter app ports it, not redesigns it. |
| Repo | `ZuniShahid/njia` (GitHub), created by Zunair on 3 Nov 2026. |

## 2. What exists and its status

| Part | Files | Status |
| --- | --- | --- |
| Data model | `schema/njia.schema.json` (15 collections, provenance on every content doc) | done |
| Seed data | `seed/*.json` – 11 countries, 10 corridors, 23 residence permits, 21 requirements, 14 funding, 12 pathways, 6 occupations, 30 sources, 5 trust alerts, 3 providers (135 docs) | validated (`npm run validate` → "seed OK"); fees/deadlines partly `trust: "estimate"` – first review round pending |
| Firestore | `firestore.rules`, `firestore.indexes.json` (TTL on `jobs.expireAt`), `storage.rules`, `firebase.json`, `.firebaserc` (njia-prod) | rules/indexes **not deployed yet** (project exists, see below) |
| Planning engine | `functions/src/engine.mjs` + `functions/test/engine.test.mjs` (4 tests); Dart port `app/lib/core/engine/engine.dart` + `app/test/engine_test.dart` (same 4 cases) + `engine_parity_test.dart` (output identical to the JS engine, fixture via `npm run engine:fixture`) | done, tests green |
| Cloud Functions | `functions/src/index.mjs` (api, review, onChangeRequestWritten, onGoalWritten, computePlan, setRole), `changes.mjs` | written, **not deployed** |
| n8n flows | `n8n/njia-1-source-check.js`, `njia-2-notify-reviewer.js`, `njia-3-jobs-refresh.js`; created in n8n as "Njia 1 – Source check" (id 1tmUJrpW85k4v2o5), "Njia 2 – Notify reviewer" (lgUfq7EKOUPUZ9Dv), "Njia 3 – Jobs refresh" (UVzN9LCe5URaQzSK), project Dy9ixzJXAYkO6P6G | created, **inactive**; Settings nodes and credentials still to fill (`docs/setup.md` §2) |
| Prototype | `app/prototype/njia.html` (v8, single file, vanilla JS, sample data) | approved by Philipp |
| Flutter app | `app/` – skeleton: go_router routes for every prototype view, Riverpod, Firebase init with Firestore persistence, theme tokens + font from the prototype, left/bottom nav shell, `ProvenanceChip`, repositories (content/user/jobs), Dart models generated from the schema (`npm run gen:models`, committed) | skeleton done; screens are placeholders; `firebase_options.dart` is a placeholder until task 1 |
| Docs | `docs/architecture.md`, `setup.md`, `data-model.md`, `plan.md`, `prototype-notes.md` | current |

External things that exist but are not in the repo:
- n8n credentials on n8n.keevana.com: Firestore service account "Google Firebase Cloud Firestore account 3" (n8n-firestore@keepa-lean – needs IAM role *Cloud Datastore User* on njia-prod), "Claude Header Auth account", WhatsApp Business account. Still to create: Gmail OAuth2 "Njia Gmail", HTTP Query Auth "Adzuna app_key".
- Firebase project `njia-prod` (project number 778432942041): **created 3 Nov 2026** by Philipp's Google account keevana.app@gmail.com. Done: Firestore `(default)` in **eur3 (Europe)**, Standard edition, production-mode rules; Authentication with Email/Password + Google (public name "Njia Careers", support e-mail keevana.app@gmail.com); web app "Njia Careers Web" registered with Hosting (config in `app/firebase-web-config.json`). Not done: **Blaze plan upgrade** (needed for Storage and Cloud Functions – Philipp must attach a billing account), Storage bucket, deploy of rules/indexes/functions, seed import, admin user. Analytics and Gemini were left off on purpose.

## 3. Next tasks, in order

1. **Firebase project** `njia-prod` exists (Spark). Remaining: Blaze upgrade (Philipp), create Storage bucket in europe-west1, `firebase deploy --only firestore:rules,firestore:indexes,storage`, `npm run seed`, deploy functions, create admin user with claim `role: admin` (`docs/setup.md`).
2. ~~**Flutter app skeleton**~~ done (`app/README.md`). `app/lib/firebase_options.dart` carries the real web config from `app/firebase-web-config.json`; Android/iOS values are still placeholders – run `flutterfire configure --project=njia-prod` once the Android/iOS apps are registered.
3. ~~**Models from schema**~~ done – `scripts/gen-models.mjs` generates them; rerun after schema changes.
4. ~~**Engine port**~~ done – `app/lib/core/engine/engine.dart`, 4 tests + parity test against the JS output.
5. **Screens**, in this order (each one mirrors the prototype view, see `docs/prototype-notes.md`): Auth → Profile → Goal (create/edit) → Cockpit → Roadmap → Readiness → Finances → Visa & residence → Jobs → Big picture → Coach → Documents → Next milestone → Admin review queue (`/admin/changes`, editors only).
6. **Responsive**: ≥1180 px three columns (nav · center · right panel), <860 px bottom nav + sheet; roadmap view hides the right panel and shows decisions/watch-outs below.
7. **Coach backend**: Cloud Function `coach` that calls Claude (Haiku for chat) with the guard rails from the prototype (no ghostwriting), context = selected phase/step/pool.
8. **n8n**: fill Settings nodes, create the two missing credentials, run Njia 1 once manually, activate all three.
9. **First review round**: approve/correct all `trust: "estimate"` facts for the 10 countries against the official pages listed in `seed/sources.json`.
10. Web build to Firebase Hosting (PWA), then Android/iOS builds.

Open inputs needed from Philipp: reviewer name/e-mail/WhatsApp number; Adzuna developer account (app_id/app_key); WhatsApp template `njia_review_needed` approval; trademark/domain decision.

## 4. How the pieces fit

```
Student (Flutter)  ──reads──▶ Firestore content (approved only, provenance on every doc)
       │ writes goals/profile                ▲ onChangeRequestWritten applies approved changes
       ▼                                      │
users/{uid}/goals ──onGoalWritten──▶ computePlan (engine.mjs) ──▶ users/{uid}/plans
                                                                      ▲
n8n Njia 1 (14 d) ─Claude extraction─▶ changeRequests(pending) ─Njia 2─▶ reviewer e-mail/WhatsApp ─approve link─▶ review()
n8n Njia 3 (daily) ─Adzuna─▶ jobs (TTL 30 d)
```

## 5. Links
- Prototype (live): https://claude.ai/artifact/X1ZHUwPKPKV7CEtbBizSMZ
- Planning doc (German, Claude Doc): https://claude.ai/artifact/JMZUTByitTt2ubkwhxcmTr – same content in `docs/plan.md`
- Earlier research "Njia – Öffentliche Jobquellen pro Kontinent": https://claude.ai/artifact/JtaU45QXddRXQNdyaxTXME
- n8n: https://n8n.keevana.com

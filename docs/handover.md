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
| Firestore | `firestore.rules`, `firestore.indexes.json` (TTL on `jobs.expireAt`), `storage.rules`, `firebase.json`, `.firebaserc` (njia-prod) | **deployed 3 Nov 2026**; seed imported (135 docs) |
| Planning engine | `functions/src/engine.mjs` + `functions/test/engine.test.mjs` (4 tests); Dart port `app/lib/core/engine/engine.dart` + `app/test/engine_test.dart` (same 4 cases) + `engine_parity_test.dart` (output identical to the JS engine, fixture via `npm run engine:fixture`) | done, tests green |
| Cloud Functions | `functions/src/index.mjs` (api, review, onChangeRequestWritten, onGoalWritten, computePlan, setRole), `changes.mjs` | **all 6 deployed 3 Nov 2026** (europe-west1, Node 22) |
| n8n flows | `n8n/njia-1-source-check.js`, `njia-2-notify-reviewer.js`, `njia-3-jobs-refresh.js`; created in n8n as "Njia 1 – Source check" (id 1tmUJrpW85k4v2o5), "Njia 2 – Notify reviewer" (lgUfq7EKOUPUZ9Dv), "Njia 3 – Jobs refresh" (UVzN9LCe5URaQzSK), project Dy9ixzJXAYkO6P6G | Njia 1 + 2 **active**; Njia 1 republished 4 Nov 2026 with the `manual` skip; seed re-imported 4 Nov (138 docs, task 9a sources). Njia 3 inactive until the Adzuna app_id/app_key exist |
| Prototype | `app/prototype/njia.html` (v8, single file, vanilla JS, sample data) | approved by Philipp |
| Flutter app | `app/` – skeleton (router, Riverpod, Firebase init with persistence, prototype tokens + font, nav shell, `ProvenanceChip`, repositories, models generated from the schema). Screens built: **Auth** (email + Google), **Profile** (all prototype sections, partial saves), **Goal** (form, drawer with goal switcher, `/goal/:id`), **Cockpit** and **Roadmap** (driven by the server plan, or the Dart engine until it exists; `RoadmapModel` groups steps into phases; per-goal progress in `users/{uid}.progress`; every content number has a `ProvenanceChip`). **Readiness** (route requirements by dimension; a tick writes the fact to `users/{uid}.facts` and calls `computePlan`), **Finances** (costs from the plan, funds from profile + user sources + scholarships in plan; per-phase coverage, savings planner, scholarships from `funding`), **Visa & residence** (permits per destination with corridor/permit provenance, requirement statuses per goal, trust alerts). **Next milestone** (phase checklist from steps, requirement proofs and permit checklists; help preferences in `users.helpPreferences`; tutors from `providers`), **Big picture** (nine pools with statuses from the real models, web/order layouts, drag-to-link, detail card), **Jobs** (postings from `jobs`, match score, save), **Coach** (path + study coach UI, `coach` callable, local paragraph check, transparency log), **Documents** (needed docs from the route merged with uploads, Storage upload), **Admin review queue** (pending `changeRequests` with diff, quote, approve/reject). Preview without Firebase: `flutter run -t lib/main_preview.dart` | web config real; Android/iOS Firebase apps not registered yet; remaining screens are placeholders |
| Docs | `docs/architecture.md`, `setup.md`, `data-model.md`, `plan.md`, `prototype-notes.md` | current |

External things that exist but are not in the repo:
- n8n credentials on n8n.keevana.com: Firestore service account "Google Firebase Cloud Firestore account 3" (n8n-firestore@keepa-lean – needs IAM role *Cloud Datastore User* on njia-prod), "Claude Header Auth account", WhatsApp Business account. Gmail OAuth2 "Njia Gmail account" exists (3 Nov 2026). Still to create: HTTP Query Auth "Adzuna app_key".
- Firebase project `njia-prod` (project number 778432942041): **created 3 Nov 2026** by Philipp's Google account keevana.app@gmail.com. Done: Firestore `(default)` in **eur3 (Europe)**, Standard edition, production-mode rules; Authentication with Email/Password + Google (public name "Njia Careers", support e-mail keevana.app@gmail.com); web app "Njia Careers Web" registered with Hosting (config in `app/firebase-web-config.json`). Since then: Blaze plan active, Storage bucket in europe-west1, rules/indexes/functions deployed, seed imported, first admin user created with claim `role: admin` (`scripts/make-admin.mjs`). Gmail API enabled and an OAuth client for the n8n Gmail credential created. Deploys run from Google Cloud Shell. Analytics and Gemini were left off on purpose.

## 3. Next tasks, in order

1. ~~Firebase project~~ done. Remaining infra: give the n8n Firestore service account the role Cloud Datastore User on njia-prod; WhatsApp template `njia_review_needed` (WhatsApp account Keevana POS) awaiting Meta approval; Adzuna account for Njia 3.
2. ~~**Flutter app skeleton**~~ done (`app/README.md`). `app/lib/firebase_options.dart` carries the real config for web, Android and iOS (apps registered 3 Nov 2026, all `com.revana.njia`). Still open for Android Google sign-in: add the release SHA-1 in Firebase once signing is set up (Zunair). iOS builds need a Mac/Xcode or a build service (Zunair). Apple and Google Play developer accounts exist.
3. ~~**Models from schema**~~ done – `scripts/gen-models.mjs` generates them; rerun after schema changes.
4. ~~**Engine port**~~ done – `app/lib/core/engine/engine.dart`, 4 tests + parity test against the JS output.
5. **Screens**, in this order (each one mirrors the prototype view, see `docs/prototype-notes.md`): ~~Auth → Profile → Goal (create/edit) → Cockpit → Roadmap → Readiness → Finances → Visa & residence → Jobs → Big picture → Coach → Documents → Next milestone → Admin review queue~~ all done (`/admin/changes` is role-gated via `users/{uid}.roles`). Open follow-ups: the coach chat needs the `coach` Cloud Function (task 7) – until then the UI says "not connected"; jobs show an empty state until the Adzuna import runs; document uploads go to Storage `users/{uid}/documents/…`. Phone sign-in is not enabled in Firebase Auth, so the auth screen offers email + Google only.
6. **Responsive**: ≥1180 px three columns (nav · center · right panel), <860 px bottom nav + sheet; roadmap view hides the right panel and shows decisions/watch-outs below.
7. **Coach backend**: Cloud Function `coach` that calls Claude (Haiku for chat) with the guard rails from the prototype (no ghostwriting), context = selected phase/step/pool.
8. **n8n**: fill Settings nodes, create the two missing credentials, run Njia 1 once manually, activate all three.
9a. ~~Fix 6 sources that failed on the first run~~ done in the repo (`seed/sources.json`), **re-seed still needed** (`npm run seed` with the service account, or update the 9 `sources` docs by hand) and **Njia 1 must be re-published** from `n8n/njia-1-source-check.js` so that `extractor: "manual"` is skipped like `api`. What changed: 404s → current official pages (`at-studyinaustria-fees` → studyinaustria.at/en/plan-your-studies/tuition-fee; `nl-ind-study` → ind.nl/en/residence-permits/study for work rights, plus new `nl-ind-fees` and `nl-ind-required-amounts` for fee / funds proof). 403s → more specific official pages where they exist (`fi-migri-study` → migri.fi/en/residence-permit-application-for-studies, new `fi-migri-income`; `no-embassy-sl` → norway.no/en/sierra-leone/central-visa-handling/), otherwise `extractor: "manual"` with cadence 90 days (`fr-visas-sl`, `ie-fellows-africa`). The new URLs come from the search index; they could not be fetched from the cloud session (network policy), so the next Njia 1 run is the real test. Note for the reminder: nothing sends a "check by hand" mail for manual sources yet – add that to Njia 2 or a small scheduled flow.
9b. **Facts spotted while fixing 9a – verify in the review round, not applied to the seed**: Migri first study permit fee EUR 600 online / 750 paper from 1 Jan 2026 and income requirement EUR 800/month (migri.fi news page); IND study application fee EUR 254 and required amount EUR 1,130.77/month for 2026 (ind.nl "Fees and required amounts for 2026 known"); Austria public universities EUR 751.92/semester for third-country students (studyinaustria.at tuition page); France: applications lodged in Freetown via Capago, decided by the French Embassy in Guinea (france-visas.gouv.fr/en/sierra-leone); Norway: applications from Sierra Leone handled by the embassy in Nairobi via VFS (norway.no central-visa-handling). All from search snippets, not from the pages themselves.
9. **First review round**: approve/correct all `trust: "estimate"` facts for the 10 countries against the official pages listed in `seed/sources.json`.
10. Web build to Firebase Hosting (PWA), then Android/iOS builds.

Open inputs needed from Philipp: Adzuna developer account (app_id/app_key); WhatsApp template `njia_review_needed` approval (submitted 3 Nov 2026); trademark/domain decision. Reviewer = Philipp (contact data in n8n only).

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

## 6. Web preview

The Flutter web build is published on a Firebase Hosting **preview channel** (not production): the build on branch `web-build` is deployed via Cloud Shell with `firebase hosting:channel:deploy preview --expires 7d`. Preview URLs expire after 7 days; redeploy after each merge. Production (`njia-prod.web.app`) stays empty until Philipp decides to go live. Google sign-in only works on authorized domains (`njia-prod.web.app`, `njia-prod.firebaseapp.com`); on preview URLs use e-mail/password.

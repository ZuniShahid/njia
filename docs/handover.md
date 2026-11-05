# Handover – state on 5 November 2026

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
| Seed data | `seed/*.json` – 11 countries, 10 corridors, 23 residence permits, 21 requirements, 14 funding, 12 pathways, 6 occupations, 33 sources, 5 trust alerts, 3 providers (138 docs); copied to `app/assets/seed` by `npm run gen:models` for previews/tests | validated (`npm run validate` → "seed OK"); fees/deadlines partly `trust: "estimate"` – first review round pending |
| Firestore | `firestore.rules`, `firestore.indexes.json` (TTL on `jobs.expireAt`), `storage.rules`, `firebase.json`, `.firebaserc` (njia-prod) | **deployed 3 Nov 2026**; seed imported 3 Nov (135 docs) and re-imported 4 Nov (138 docs) |
| Planning engine | `functions/src/engine.mjs` + `functions/test/engine.test.mjs` (4 tests); Dart port `app/lib/core/engine/engine.dart` + `app/test/engine_test.dart` (same 4 cases) + `engine_parity_test.dart` (output identical to the JS engine, fixture via `npm run engine:fixture`) | done, tests green |
| Cloud Functions | `functions/src/index.mjs` (api, review, onChangeRequestWritten, onGoalWritten, computePlan, setRole), `changes.mjs` | **all 6 deployed 3 Nov 2026** (europe-west1, Node 22) |
| n8n flows | `n8n/njia-1-source-check.js`, `njia-2-notify-reviewer.js`, `njia-3-jobs-refresh.js`; created in n8n as "Njia 1 – Source check" (id 1tmUJrpW85k4v2o5), "Njia 2 – Notify reviewer" (lgUfq7EKOUPUZ9Dv), "Njia 3 – Jobs refresh" (UVzN9LCe5URaQzSK), project Dy9ixzJXAYkO6P6G | Njia 1 + 2 **active**; Njia 1 republished 4 Nov 2026 with the `manual` skip; seed re-imported 4 Nov (138 docs, task 9a sources). Njia 3 inactive until the Adzuna app_id/app_key exist |
| Prototype | `app/prototype/njia.html` (v8, single file, vanilla JS, sample data) | approved by Philipp |
| Flutter app | `app/` (Flutter 3.47.9 / Dart 3.13.7, package `com.revana.njia`, store name "Njia Careers"). Skeleton: go_router (one route per prototype view + `/auth`, `/goal/:id`, `/admin/changes`), Riverpod, Firebase init with Firestore persistence and a 15 s timeout, prototype tokens + Plus Jakarta Sans, nav shell (left nav > 860 px, bottom nav + More sheet ≤ 860 px, goal switcher, account menu), `ProvenanceChip`. Models generated from the schema (`npm run gen:models`, committed). Engine port + `RoadmapModel`, `ReadinessModel`, `FinanceModel`, `MilestoneModel`. Repositories behind interfaces (auth, user, content, jobs, documents, change requests, coach, plan) with in-memory fakes + sample data for `flutter run -t lib/main_preview.dart` (`--dart-define=EDITOR=true` shows the admin queue). **All 14 prototype views + admin queue are built**: Auth · Profile · Goal · Cockpit · Roadmap · Readiness · Finances · Visa & residence · Next milestone · Big picture · Jobs · Coach · Documents · `/admin/changes`. | `flutter analyze` clean, 79 tests green; `firebase_options.dart` real for web/Android/iOS; what is still missing is listed under "Next tasks" (coach function, Adzuna, responsive polish) |
| Docs | `docs/architecture.md`, `setup.md`, `data-model.md`, `plan.md`, `prototype-notes.md`, `app/README.md` | current |

### External state (not in the repo, no secrets here)

**GitHub** `ZuniShahid/njia`: `main` is the integration branch; feature work goes through PRs (#1–#6 merged 3–5 Nov 2026). Branch **`web-build`** holds the release web build (`app/build/web`, force-added despite `.gitignore`) on top of `main`; it is a deploy artifact and is **never merged into `main`**. Rebuild it after each merge: `cd app && flutter build web --release`, then `git add -f app/build/web` on that branch.

**Firebase project `njia-prod`** (project number 778432942041, created 3 Nov 2026 by Philipp's Google account keevana.app@gmail.com, Blaze plan):
- Firestore `(default)` in eur3 (Europe), Standard edition; rules + indexes deployed 3 Nov; seed imported 3 Nov and re-imported 4 Nov (138 docs) from Cloud Shell with a service-account key that is **not** in the repo.
- Authentication: Email/Password + Google (public name "Njia Careers", support e-mail keevana.app@gmail.com). Phone sign-in is not enabled. Authorized domains for Google sign-in: `njia-prod.web.app`, `njia-prod.firebaseapp.com`.
- Storage bucket in europe-west1, `storage.rules` deployed. Cloud Functions (6, europe-west1, Node 22) deployed 3 Nov from Cloud Shell. The `coach` function does not exist yet (task 7).
- Apps: web "Njia Careers Web" (config also in `app/firebase-web-config.json`), Android and iOS registered 3 Nov, all `com.revana.njia`; `app/lib/firebase_options.dart` carries all three configs (public client identifiers). Android release SHA-1 for Google sign-in not added yet.
- First admin user created with claim `role: admin` via `scripts/make-admin.mjs` (whose uid/e-mail is not recorded here). Gmail API enabled and an OAuth client created for the n8n Gmail credential. Analytics and Gemini left off on purpose.
- Hosting: production `njia-prod.web.app` is empty on purpose. The web preview runs on a Hosting **preview channel** deployed from Cloud Shell with `firebase hosting:channel:deploy preview --expires 7d` from the `web-build` branch; the URL expires after 7 days and is not recorded in the repo – whoever deployed last has it; redeploy after each merge.
- Everything "done in Cloud Shell" (deploys, seeding, make-admin, preview deploy) needs the Firebase CLI logged in to the project; a Claude Code cloud session has no such credentials unless a service-account key is stored as an environment secret (none is).

**n8n** (self-hosted, https://n8n.keevana.com, project Dy9ixzJXAYkO6P6G):
- Workflows: "Njia 1 – Source check" (id 1tmUJrpW85k4v2o5) – **active**, republished 4 Nov 2026 from `n8n/njia-1-source-check.js` (skips `extractor: api|manual`); "Njia 2 – Notify reviewer" (id lgUfq7EKOUPUZ9Dv) – **active**, points at njia-prod, reviewer set; "Njia 3 – Jobs refresh" (id UVzN9LCe5URaQzSK) – **inactive** until the Adzuna credential exists.
- Credentials (names only): Firestore service account "Google Firebase Cloud Firestore account 3" (n8n-firestore@keepa-lean; needs IAM role Cloud Datastore User on njia-prod – still to grant), "Claude Header Auth account", "Njia Gmail account" (Gmail OAuth2), WhatsApp Business account (Keevana POS). Still to create: HTTP Query Auth "Adzuna app_key".
- WhatsApp template `njia_review_needed` submitted to Meta 3 Nov 2026, approval pending.
- Reviewer = Philipp; contact data lives in n8n only.

**Claude artifacts**: prototype https://claude.ai/artifact/X1ZHUwPKPKV7CEtbBizSMZ, planning doc https://claude.ai/artifact/JMZUTByitTt2ubkwhxcmTr (same text in `docs/plan.md`).

### What was done since 3 November 2026 (Claude Code sessions, all merged to `main`)

| PR | Content |
| --- | --- |
| #1 | Flutter skeleton, schema → Dart model generator, Dart engine port with the 4 tests + parity test |
| #2 | Screens Auth, Profile, Goal (form, drawer, goal switcher); schema fields for the profile/goal; fakes + preview entry point |
| #3 | Screens Cockpit and Roadmap; `RoadmapModel`; per-goal progress in `users/{uid}.progress` |
| #4 | Task 9a: the 6 failing sources fixed in `seed/sources.json`, `extractor: "manual"` added to schema + Njia 1 |
| #5 | Screens Readiness, Finances, Visa & residence; `setFact` + `computePlan` callable; `ReadinessModel`, `FinanceModel` |
| #6 | Screens Next milestone, Big picture, Jobs, Coach, Documents and the admin review queue; `MilestoneModel`; documents/change-request/coach repositories |
| – | Claude Chat (Cloud Shell): Firebase project set-up, deploys, seeding, admin user, Android/iOS app registration, n8n credentials/republish, preview channel |

## 3. Next tasks, in order

1. **Coach backend** (was 7) – built 5 Nov 2026 (see Coach note below), needs the API key secret and a deploy. Original brief: Cloud Function `coach` (callable, europe-west1) that calls Claude (Haiku 5.5 for chat) with the guard rails from the prototype – guide, never ghostwrite; context = goal, selected phase/step/pool from the plan, relevant content docs with provenance; cite the source of every number. The app already calls it (`app/lib/data/coach_service.dart`, payload `{goalId, context, history, question}` → `{text}`) and shows "not connected" until it exists.
2. **Responsive polish** (was 6): ≥ 1181 px three columns are in place via `ViewScaffold`; still to do: the right panel as a slide-in sheet on 861–1180 px, "Hide panel" toggle with remembered state, the scroll-triggered chatbot peek, nav-item active states on mobile.
3. **Jobs feed**: Adzuna developer account (Philipp) → n8n credential "Adzuna app_key" → fill Njia 3 Settings → run once → activate. The Jobs screen reads the `jobs` collection as it is.
4. **Review round** (was 9): approve/correct all `trust: "estimate"` facts for the 10 countries against the pages in `seed/sources.json`, in `/admin/changes` or directly in the seed + re-import. Hints found on the way (not applied): Migri first study permit fee EUR 600 online / 750 paper from 1 Jan 2026 and income EUR 800/month; IND study fee EUR 254 and required amount EUR 1,130.77/month for 2026; Austria EUR 751.92/semester for third-country students; France applications via Capago in Freetown decided in Conakry; Norway handled in Nairobi via VFS. All from search snippets, verify on the pages.
5. **Infra leftovers**: grant the n8n Firestore service account the role Cloud Datastore User on njia-prod; WhatsApp template approval; a reminder for `extractor: "manual"` sources (nothing mails the reviewer yet); add Android release SHA-1 once signing exists; iOS build needs a Mac/Xcode or a build service (Zunair).
6. **Go live** (was 10): deploy the web build to production Hosting when Philipp decides; Android/iOS store builds; trademark/domain decision (candidates njia.africa, njia.app, getnjia.com).
7. **Known product gaps to decide**: ticking "IELTS 6.5" on Readiness sets the fact to 6.5, so a stricter "IELTS 7.0" on the same key becomes a gap (engine behaviour, covered by a test); scores are estimates until outcomes exist (`users/{uid}/outcomes`); the study coach keeps sessions in memory only.

**Play Store release prep (5 Nov 2026, PR "Play Store release kit")**: `docs/release/play-store.md` (listing texts, data safety, content rating, release steps, who does what) and `docs/release/android-signing.md`; release builds sign with `app/android/key.properties` when present; privacy policy and account-deletion pages in `app/web/`; new callable `deleteAccount` deletes users/{uid} recursively, Storage `users/{uid}/` and the Auth user (the app falls back to the old client-side delete while the function is not deployed). Still needed: placeholders in the two pages (`grep -rn "TODO(Philipp)" app/web docs/release`), app icon, upload key, deploy functions + hosting, njia.keevana.com on Hosting, then the Play Console forms. Play account is an organisation account (no 12-tester closed test).

**Coach (5 Nov 2026, PR "Coach function")**: callable `coach` in `functions/src/index.mjs` + `functions/src/coach.mjs` (7 unit tests). Model `claude-sonnet-5-5` by default (Philipp's choice, quality over cost), set in `functions/.env` (committed, non-secret; `firebase deploy --non-interactive` fails without it), e.g. `COACH_MODEL=claude-haiku-5-5`. Limit 10 questions per user per day (UTC), counter in `users/{uid}/usage/coach-<day>`. To go live: create an Anthropic API key "njia-coach" (Console, Revana workspace), then in Cloud Shell `firebase functions:secrets:set ANTHROPIC_API_KEY` and `firebase deploy --only functions:coach`. The app already calls it and shows "not connected" until then.

**Live feedback round (5 Nov 2026, PR "Fixes and onboarding")**: coach crashed on Firestore Timestamps in provenance (fixed, regression test); Jobs needed the index `jobs(countryId ASC, postedAt DESC)` (created in production with gcloud, now also in `firestore.indexes.json`); roadmap now shows a synthetic "Grow · <country>" phase (kind `grow`, keys `grow:first-job` / `grow:experience`, no facts) between the last planned step and the goal; first goal offers three starter goals (`starterGoals` in `goal_constants.dart`: Dublin master, German bank apprenticeship, Budapest bachelor – all plannable with the seed); password show/hide on sign-in; getting-started checklist on the cockpit (5 steps checked against real data, state in `progress[goalId].guide`: `welcomed`, `hidden`, `roadmap`) with a one-time welcome dialog.

Open inputs needed from Philipp: Adzuna developer account (app_id/app_key); WhatsApp template approval; trademark/domain decision; go-live decision.

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

See "External state" above: branch `web-build` → Cloud Shell → `firebase hosting:channel:deploy preview --expires 7d`. Production stays empty until go-live. Google sign-in works only on the authorized domains; on preview URLs use e-mail/password.

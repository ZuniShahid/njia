# Architecture

```
                 ┌──────────────── Flutter (one codebase) ────────────────┐
                 │  Web (Firebase Hosting)   Android (Play)   iOS (App Store)│
                 │  features/: goals roadmap readiness finances visa jobs     │
                 │             coach documents profile admin(review queue)    │
                 │  data/: ContentRepo (corridor bundle, cached) UserRepo     │
                 │  domain/engine (Dart port of engine.mjs for offline)       │
                 └───────┬───────────────────────┬────────────────────┬──────┘
                         │ Firestore SDK          │ callable/REST      │ Auth
┌────────────────────────▼───────────────────────▼────────────────────▼──────┐
│ Firebase project njia-prod (europe-west1)                                   │
│  Firestore: countries corridors pathways requirements residencePermits      │
│             funding occupations jobs(TTL) providers trustAlerts sources      │
│             changeRequests refreshRuns meta · users/{uid}/{goals,plans,…}    │
│  Functions: api · review · onChangeRequestWritten · onGoalWritten ·          │
│             computePlan · setRole        Storage: user documents, snapshots  │
└───────────────▲──────────────────────────────────────────▲─────────────────┘
                │ service account                            │ approve/reject link
┌───────────────┴──────────────┐              ┌─────────────┴───────────────┐
│ n8n (self-hosted, Keevana)    │              │ Reviewer (e-mail + WhatsApp) │
│  Njia 1 Source check (14 d)   │──Claude──▶   │ admin page in the web app    │
│  Njia 2 Notify reviewer       │              └─────────────────────────────┘
│  Njia 3 Jobs refresh (daily)  │──Adzuna API
└───────────────────────────────┘
```

## Flutter project layout (proposal)

```
app/
  lib/
    main.dart                      Firebase init, Firestore persistence on, router
    app/router.dart                go_router: /, /goal/:id, /roadmap, /readiness, /finances, /visa, /jobs, /coach, /documents, /profile, /admin/changes
    app/theme.dart                 tokens from the prototype (brand, p1–p6, dark mode)
    core/models/                   freezed models generated from schema/njia.schema.json (country, corridor, pathway, requirement, permit, funding, occupation, job, provider, trustAlert, changeRequest, userProfile, goal, plan)
    core/engine/                   Dart port of functions/src/engine.mjs (evaluateRequirement, buildPlan, factsFromProfile) – keep in sync; the server result (users/{uid}/plans) is canonical
    data/content_repository.dart   loads a corridor bundle (country + corridor + permits + pathways + funding + requirements + alerts), caches by meta/content.version
    data/user_repository.dart      users/{uid}, goals, documents, outcomes
    data/jobs_repository.dart      jobs query by country/occupation/level/salary
    features/<name>/               one folder per screen: view, controller (Riverpod), widgets
    shared/widgets/                ProvenanceChip ("Checked 2 Nov 2026 · source" / "Estimate · to verify"), ScoreRing, Timeline, Checklist, MoneyText
  web/                             index.html, manifest (PWA so it also works as "app" without the stores)
  android/ ios/                    flavors: dev / prod
```

Rules of thumb
- **Responsive, not separate apps**: ≥1180 px → three columns (nav · center · right panel) like the prototype; < 860 px → bottom nav, right panel becomes a sheet. One widget tree, `LayoutBuilder` decides.
- **Offline first**: `FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true)`; content bundles are small (a corridor is < 200 KB), so the app works on poor connections in Freetown.
- **Provenance everywhere**: any widget that shows a number from content renders `ProvenanceChip(doc.provenance)`.
- **Admin in the same app**: `/admin/changes` lists `changeRequests` where status == pending; visible only with custom claim `role in [editor, admin]`.
- **Coach** (path + study): callable `coach` (`functions/src/coach.mjs`). Loads goal, plan and the referenced content docs with provenance itself (never trusts the client for facts), calls Claude Sonnet 5.5 (`COACH_MODEL`, switchable to Haiku), guard rails in the system prompt (no ghostwriting, every number with its source or marked as estimate, no promises). 10 questions per user per day in `users/{uid}/usage/coach-YYYY-MM-DD` (server-only; given back if the call fails). API key in Secret Manager (`ANTHROPIC_API_KEY`). Sonnet 5.5 for extraction too.

## Scores
- Readiness = met / (met + gap + ½·unknown) over the requirements of the chosen pathways + entry permit.
- Difficulty (1–5) = 0.4·corridor prior + 0.3·easiest funding difficulty + 0.3·(1 + gaps/2).
- Realism (0–100) = 0.4·readiness + 0.25·(1 − (difficulty−1)/4) + 0.2·finance coverage + 0.15·time fit.
- Calibrate with `users/{uid}/outcomes` (consented) once there are ≥ 50 real outcomes per corridor.

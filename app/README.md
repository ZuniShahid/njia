# Njia Careers – Flutter app

Flutter 3.47 / Dart 3.13 · web + Android + iOS from one codebase · package `com.revana.njia` · store name "Njia Careers".
UI reference: `prototype/njia.html` (v8) and `docs/prototype-notes.md` – port it, don't redesign it.

```
flutter pub get
flutter test                      # engine port (4 cases + parity with engine.mjs), seed round-trips, app smoke test
flutter analyze
flutter run -d chrome                         # real Firebase (web config is in firebase_options.dart)
flutter run -d chrome -t lib/main_preview.dart   # sample data, no Firebase – look at screens without signing in
                                                 # add --dart-define=EDITOR=true to see /admin/changes
```

## Layout (docs/architecture.md)

```
lib/
  main.dart                   Firebase init (offline persistence on), ProviderScope, NjiaApp
  firebase_options.dart       real config for web, Android and iOS (project njia-prod)
  app/                        app.dart (MaterialApp.router) · router.dart (go_router, one route per prototype view)
                              theme.dart (tokens from the prototype, light + dark) · shell.dart (left nav / bottom nav)
                              providers.dart (Firebase handles, auth state, repositories)
  core/models/                GENERATED from ../schema/njia.schema.json – see below. plan.dart is hand-written (engine shape).
  core/engine/                Dart port of ../functions/src/engine.mjs (engine.dart) + ContentBundle. Keep in sync!
                              roadmap_model.dart: plan → phases, year axis, milestone, tasks, deadlines, decisions (for cockpit/roadmap)
                              readiness_model.dart (requirements by dimension) · finance_model.dart (costs/funds per year, scholarships fit)
                              milestone_model.dart (phase checklist: steps, proofs, permit checklist items)
  data/                       content_repository · user_repository (incl. setFact) · jobs_repository · documents_repository (Storage)
                              change_request_repository (review queue) · coach_service (`coach` callable) · plan_service (computePlan callable)
                              firestore_codec (Timestamp → ISO, id in/out)
  features/<view>/            one folder per screen – all prototype views are built (auth, profile, goal, cockpit, roadmap, readiness, finances, visa, milestone, big_picture, jobs, coach, documents) plus admin (review queue)
  preview/                    sample_data.dart (Aminata Kamara, 2 goals) · fakes.dart (in-memory auth/user/content) – used by main_preview.dart and tests
  shared/                     format.dart (dates, money) · widgets/ui.dart (PageHead, badges, accordion, chips, fields…) · provenance_chip · view_scaffold
assets/fonts/                 Plus Jakarta Sans (OFL), the prototype font
assets/seed/                  copy of ../seed (npm run gen:models) for main_preview.dart and widget tests
test/                         engine_test (the 4 cases from functions/test) · engine_parity_test (fixture from the JS engine)
                              models_test (every seed doc round-trips) · app_test (routing + shell) · auth_test · profile_test · goal_test
                              roadmap_model_test · cockpit_roadmap_test · readiness_finance_model_test · readiness_finances_visa_test
                              milestone_bigpicture_jobs_coach_docs_test · admin_test
```

## Models

`lib/core/models/*.dart` are generated from the JSON Schema; the `.freezed.dart` / `.g.dart` files are committed so
`flutter test` works right after `flutter pub get`. After changing `schema/njia.schema.json`:

```
npm run gen:models                                     # repo root → writes lib/core/models/*.dart
dart run build_runner build --delete-conflicting-outputs   # in app/
```

Naming: collection → singular class (`countries` → `Country`, `residencePermits` → `ResidencePermit`, `users` → `UserProfile`,
`providers` → `ServiceProvider`, `sources` → `ContentSource` – the last two avoid clashes with Riverpod/Firestore names).
Enums carry their wire value (`RequirementOperator.gte.value == '>='`). Content docs have a required `id`, user docs an optional one.
Dates stay ISO strings (`firestore_codec.dart` converts Firestore Timestamps on read).

## Engine

`buildPlan`, `evaluateRequirement`, `readinessScore`, `selectPathways`, `factsFromProfile` – same names and semantics as
`engine.mjs`. The server plan is canonical; the port is for instant previews (tick a requirement, change money/move year).
After changing `engine.mjs`: port the change, then `npm run engine:fixture` and `flutter test`.

## Screens

Each screen mirrors its prototype view (`docs/prototype-notes.md`). Data comes through the repository interfaces in `data/`
(`AuthService`, `UserRepository`, `ContentRepository`); `preview/fakes.dart` implements them in memory so screens can be
developed and tested without Firebase. Profile sections save partial updates (`updateProfile(uid, patch)`); goals are
written to `users/{uid}/goals` and the server computes the plan (`onGoalWritten`). The active goal is `users/{uid}.activeGoalId`.
Cockpit and roadmap read `users/{uid}/plans/{goalId}`; until the server has written it, the Dart engine computes the same plan
from the corridor bundle (`effectivePlanProvider`). Step status, checklist ticks and decisions are stored per goal in
`users/{uid}.progress` (client-only, not read by the engine). Content numbers (tuition, fees, funds, living costs, funding
amounts) are looked up in the content docs the step points at, so each one renders with its `ProvenanceChip`.

## Firebase

`firebase_options.dart` holds the real client config for web, Android and iOS (apps "Njia Careers Web/Android/iOS",
package/bundle `com.revana.njia`, project `njia-prod`). Android Google sign-in also needs the release SHA-1 registered in
Firebase once signing is set up. `main.dart` catches a failed init (15 s timeout), so the app starts without data.
Firestore persistence is switched on in `initFirebase()`.

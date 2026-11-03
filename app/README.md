# Njia Careers – Flutter app

Flutter 3.47 / Dart 3.13 · web + Android + iOS from one codebase · package `com.revana.njia` · store name "Njia Careers".
UI reference: `prototype/njia.html` (v8) and `docs/prototype-notes.md` – port it, don't redesign it.

```
flutter pub get
flutter test                      # engine port (4 cases + parity with engine.mjs), seed round-trips, app smoke test
flutter analyze
flutter run -d chrome             # runs without Firebase until firebase_options.dart is real (see below)
```

## Layout (docs/architecture.md)

```
lib/
  main.dart                   Firebase init (offline persistence on), ProviderScope, NjiaApp
  firebase_options.dart       PLACEHOLDER – replace with `flutterfire configure --project=njia-prod` once the project exists
  app/                        app.dart (MaterialApp.router) · router.dart (go_router, one route per prototype view)
                              theme.dart (tokens from the prototype, light + dark) · shell.dart (left nav / bottom nav)
                              providers.dart (Firebase handles, auth state, repositories)
  core/models/                GENERATED from ../schema/njia.schema.json – see below. plan.dart is hand-written (engine shape).
  core/engine/                Dart port of ../functions/src/engine.mjs (engine.dart) + ContentBundle. Keep in sync!
  data/                       content_repository · user_repository · jobs_repository · firestore_codec (Timestamp → ISO, id in/out)
  features/<view>/            one folder per screen; currently placeholders (handover task 5)
  shared/                     format.dart (dates, money) · widgets/provenance_chip.dart · widgets/skeleton_view.dart
assets/fonts/                 Plus Jakarta Sans (OFL), the prototype font
test/                         engine_test (the 4 cases from functions/test) · engine_parity_test (fixture from the JS engine)
                              models_test (every seed doc round-trips) · app_test (routing + shell smoke test)
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

## Firebase

`firebase_options.dart` is a placeholder (project `njia-prod` does not exist yet, see `docs/setup.md` §1). `main.dart` catches
the failed init, so the app starts without data. Firestore persistence is switched on in `initFirebase()`.

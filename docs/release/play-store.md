# Njia Careers – Google Play release kit

Everything Play Console asks for, ready to paste. Placeholders marked **TODO(Philipp)** need a decision or a fact only
Philipp has. Account: organisation account (Revana EOOD), so the 12-tester / 14-day closed test does not apply;
an internal test first is still recommended.

Public pages (served from `app/web/` by Firebase Hosting, live once njia.keevana.com points at Hosting):
- Privacy policy: https://njia.keevana.com/privacy/
- Account deletion: https://njia.keevana.com/delete-account/

## 0. Placeholders to fill before the first upload

| Where | What |
| --- | --- |
| `app/web/privacy/index.html`, `app/web/delete-account/index.html` | Revana EOOD registered address, EIK, privacy contact e-mail |
| `app/web/privacy/index.html` §7 and Target audience below | minimum age (proposal: 16) |
| Store listing → contact e-mail | public support e-mail (can be the same as the privacy e-mail) |

`grep -rn "TODO(Philipp)" app/web docs/release` lists all of them.

## 1. Main store listing

**App name** (max 30): `Njia Careers`

**Short description** (max 80, this one has 76):
```
Plan your path to study or work in Europe, step by step, with checked facts.
```

**Full description** (max 4000):
```
Njia ("path" in Swahili) helps students and young professionals in Sierra Leone plan a realistic way to study or work in Europe.

Set a goal – for example a master's degree in Germany or a finance job in Ireland – and Njia shows you, year by year, what it takes to get there.

WHAT NJIA DOES
• Readiness: compares your profile with the real requirements of your route – grades, language tests, documents – and shows your gaps.
• Roadmap: turns your goal into phases and clear next steps.
• Finances: estimates tuition, living costs and proof-of-funds, and plans your savings and scholarships.
• Visa & residence: the permits for each country, what you need for them and where to apply from Sierra Leone.
• Jobs: entry-level jobs that fit your goal, from job search partners such as Adzuna.
• Documents: keep certificates and copies in one place.
• Coach: asks the right questions and points you to the next step. It guides you – it does not write your applications for you.

FACTS YOU CAN CHECK
Every fee, deadline and rule in Njia shows its source and the date it was checked. Facts that are not confirmed yet are marked "Estimate". Changes to visa, recognition or money rules are reviewed by a person before they appear in the app.

COUNTRIES
Germany, United Kingdom, Ireland, Netherlands, France, Italy, Hungary, Finland, Austria and Norway.

FAIR BY DESIGN
Njia is free for students. You never pay for job placement, and the order of jobs and routes is never for sale.

YOUR DATA
Your data is stored in Europe and belongs to you. Export or delete it at any time in the app.

Njia is an independent planning tool. It is not a government service and does not decide visa or admission applications. Always confirm important steps with the official source shown next to each fact.
```

**App category**: Education · **Tags** (pick up to 5 in Console): Education, Career, Study abroad (whatever Console offers closest).

**Contact details**: e-mail **TODO(Philipp)** · website `https://njia.keevana.com` · phone optional.

**Graphics** (see §8 for who makes what):
| Asset | Spec |
| --- | --- |
| App icon | 512 × 512 PNG, 32-bit, max 1 MB |
| Feature graphic | 1024 × 500 PNG or JPG |
| Phone screenshots | 2–8, PNG/JPG, 16:9 or 9:16, each side 320–3840 px |
| 7" / 10" tablet screenshots | optional; needed only to be featured on tablets |

## 2. App content (Policy → App content)

| Section | Answer |
| --- | --- |
| Privacy policy | `https://njia.keevana.com/privacy/` |
| App access | All or some functionality is restricted → provide a test login (e-mail + password of a reviewer account we create together; sign-in with e-mail, not Google) |
| Ads | No, the app does not contain ads |
| Content rating | questionnaire, see §4 |
| Target audience | **TODO(Philipp)**: proposal 16–17 and 18+ (not under 13, so the Families policy does not apply). "Could appeal to children": No |
| News app | No |
| COVID-19 contact tracing | No |
| Data safety | see §3 |
| Government app | No (independent tool; the description says so) |
| Financial features | None (Njia plans savings but holds or moves no money) |
| Health | No health features |
| Account deletion | in-app: Profile → Privacy & data → Delete account · web: `https://njia.keevana.com/delete-account/` |

## 3. Data safety form

Based on `schema/njia.schema.json` › `users` and `storage.rules` (5 Nov 2026). Re-check when the schema changes.

**Overview questions**
- Does the app collect or share any of the required user data types? **Yes**
- Is all user data encrypted in transit? **Yes** (Firebase, HTTPS only)
- Do you provide a way for users to request that their data is deleted? **Yes** (in app + web URL above)

**Sharing**: **No data shared.** Google Firebase and Anthropic act as service providers processing on our behalf; Play does not count that as sharing.

**Collected data types** (all: collected, not shared, processed not only ephemerally, purpose *App functionality* and where noted *Account management*):

| Play category | Data type | Required / optional | Purpose | What it is in Njia |
| --- | --- | --- | --- | --- |
| Personal info | Name | Required | App functionality, Account management | display name |
| Personal info | Email address | Required | App functionality, Account management | login e-mail |
| Personal info | User IDs | Required | Account management | Firebase uid |
| Personal info | Phone number | Optional | App functionality | profile phone |
| Personal info | Other info | Optional | App functionality | nationality, residence country/city, birth year, education, languages, experience, passport validity |
| Financial info | Other financial info | Optional | App functionality | savings, monthly support |
| Health and fitness | Health info | Optional | App functionality | only if the user writes it into the free-text "constraints" field (declared to be safe) |
| Files and docs | Files and docs | Optional | App functionality | uploaded certificates / copies |
| App activity | Other user-generated content | Optional | App functionality | goals, progress, ticked requirements, coach questions |

Not collected: location, contacts, photos/videos from the gallery (uploads go through the file picker and are declared as Files and docs), audio, calendar, web browsing, app interactions/analytics, crash logs, device or advertising IDs, payment info, messages (SMS/e-mail).

Re-check before each release: if Crashlytics, Analytics, push notifications or SMS/WhatsApp reminders are added, this form must change.

## 4. Content rating (IARC questionnaire)

- Category: **Reference, News, or Educational**
- Violence, fear, sexuality, profanity, controlled substances, gambling, crude humour: **No** to all
- Do users interact or exchange content with other users? **No** (the coach chat is with an AI assistant, not with other users)
- Does the app share the user's current physical location? **No**
- Does the app allow purchases of digital goods? **No**
- Is this a web browser or search engine? **No**

Expected outcome: lowest rating in all regions (e.g. PEGI 3 / Everyone). The certificate is issued by IARC, not by us.

## 5. Release setup

1. Signing: `docs/release/android-signing.md` (upload key, `key.properties`, SHA-1 to Firebase).
2. Version: set `version: 1.0.0+1` in `app/pubspec.yaml` for the first upload.
3. Build: `cd app && flutter build appbundle --release` → `build/app/outputs/bundle/release/app-release.aab`.
4. Play Console → Create app: name `Njia Careers`, default language English (United Kingdom) or (United States), App, Free.
5. Test and release → **Internal testing** → create release → upload the `.aab` → release notes `First internal test.` → add testers (e-mail list) → roll out.
6. Install from the internal-test link on a phone, test sign-up, Google sign-in, profile, goal, upload, export, delete.
7. Then **Production** → promote the tested release → choose countries (Sierra Leone first; add the destination countries if students abroad should find it) → send for review.

## 6. Before going public (product, not Play)

These are not Play requirements, but the store listing promises them:
- Coach: the `coach` Cloud Function does not exist yet; the screen says "not connected". Either build it first or hide the Coach entry for 1.0.
- Jobs: empty until Njia 3 (Adzuna) runs daily.
- Facts: the first review round of `trust: "estimate"` facts is still open. The app labels them "Estimate", which is honest, but many estimates at launch weaken the "facts you can check" promise.
- Deploy the `deleteAccount` Cloud Function (5 Nov 2026) and the web build with `app/web/privacy` and `app/web/delete-account` before the first upload; the deletion URL must work when Google reviews the app.
- App icon: still the default Flutter icon.

## 7. iOS (later)

Same privacy and deletion URLs. App Store Connect needs its own privacy "nutrition label" (same data as §3) and a Mac or a build service for the build (Zunair).

## 8. Who does what

| Step | Who |
| --- | --- |
| Fill placeholders (address, EIK, e-mail, minimum age) | Philipp |
| App icon + feature graphic | Philipp's designer (Claude can draft) |
| Screenshots | Claude + Philipp (emulator in Android Studio) |
| Upload key and `key.properties` | Philipp, with Claude |
| SHA-1 into Firebase | Philipp (Firebase Console), with Claude |
| Deploy functions + hosting | Cloud Shell (Philipp's Google account), with Claude |
| Play Console forms (§1–§4) | Philipp, with Claude |
| Reviewer test account | Claude creates it in the app, Philipp enters it in Play Console |

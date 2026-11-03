# Setup checklist

## 1. Firebase project
- Project `njia-prod` exists (created 3 Nov 2026, Firestore in eur3, Auth Email/Password + Google, web app registered → `app/firebase-web-config.json`). Upgrade to the **Blaze plan** (required for Storage and Functions), then create the Storage bucket in **europe-west1**.
- Enable Authentication (Email/Password + Google), Firestore, Storage, Hosting, Functions.
- `firebase deploy --only firestore:rules,firestore:indexes,storage` – the indexes file also enables the **TTL policy** on `jobs.expireAt`.
- Create a service account key for seeding (`sa.json`, role *Cloud Datastore User*), run `npm run seed`.
- Deploy functions: `cd functions && npm i && cd .. && firebase deploy --only functions`. Note the URL of `review` (…/review) and `api`.
- Make the first admin: in the Firebase console → Authentication create the reviewer's user, then run once in a Node shell with the admin SDK: `getAuth().setCustomUserClaims(uid, { role: 'admin' })`. Afterwards `setRole` (callable) can grant `editor` to others.

## 2. n8n (already created, inactive)
Workflows: **Njia 1 - Source check**, **Njia 2 - Notify reviewer**, **Njia 3 - Jobs refresh** (n8n.keevana.com, prefix "Njia").
- Firestore access: give the service account of credential "Google Firebase Cloud Firestore account 3" (n8n-firestore@keepa-lean) the IAM role *Cloud Datastore User* on `njia-prod` – or create a new Google service-account credential and select it in every Firestore node.
- Fill the **Settings** nodes: `projectId`, `reviewBaseUrl` (Njia 1), reviewer e-mail + WhatsApp number, `waPhoneNumberId`, `adminUrl` (Njia 2, both Settings nodes), Adzuna `app_id` (Njia 3).
- Credentials to create: Gmail OAuth2 "Njia Gmail" (Njia 2), HTTP Query Auth "Adzuna app_key" with name `app_key` (Njia 3). Claude uses the existing "Claude Header Auth account".
- WhatsApp: create template `njia_review_needed` (English, body with 3 variables: count, summary, link) in Meta Business Manager and wait for approval; until then only e-mails arrive.
- Run Njia 1 manually once (stores hashes only), then activate all three.

## 3. Review loop
1. Njia 1 writes `changeRequests` (status `pending`) with a per-request `approvalToken`.
2. Njia 2 e-mails/WhatsApps approve/reject links → Cloud Function `review` checks the token and sets `approved`/`rejected`.
3. `onChangeRequestWritten` applies approved changes, stamps `provenance.verifiedAt`, writes `/{collection}/{id}/history/{changeId}` and bumps `meta/content.version`.
4. The Flutter admin page (`/admin/changes`, role editor) shows before/after + quote and can approve directly (Firestore rules allow `pending → approved|rejected` for editors).

## 4. Apps
- Flutter: see `docs/architecture.md`. Web build is deployed to Firebase Hosting (`firebase deploy --only hosting`), `/api/**` is rewritten to the `api` function.
- Store names: "Njia Careers" (the bare name "Njia" is taken on the App Store by a Bible-reading app). Trademark search (TMview/EUIPO) and domain still to do.

## 5. Legal (before launch)
- Privacy policy + consent flows (GDPR; users in Sierra Leone, operator in Bulgaria, data in the EU).
- Terms: no visa/admission guarantees, no ghostwriting, no fees from job seekers (ILO C181).

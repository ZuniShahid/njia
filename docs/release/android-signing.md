# Android release signing (Google Play)

Google Play only accepts an app bundle signed with your own **upload key**. Play then re-signs the app with the
**app signing key** that Google keeps (Play App Signing). The upload key never goes into the repo.

## 1. Create the upload key (once, on Philipp's PC)

Android Studio → open `develop\njia\app` → **Build → Generate Signed App Bundle or APK → Android App Bundle → Create new…**

| Field | Value |
| --- | --- |
| Key store path | outside the repo, e.g. `C:\Users\phili\njia-keys\njia-upload.jks` |
| Key store password / key password | strong, store both in a password manager |
| Alias | `upload` |
| Validity | 25 years (Play requires the key to be valid beyond 22 Oct 2033) |
| Certificate | First and last name: Philipp Leitlein · Organization: Revana EOOD · Country code: BG |

Back up the `.jks` file and the passwords in two places. If the upload key is lost, Play support can reset it,
but that takes days; the app signing key itself is held by Google.

Command-line alternative (keytool ships with Android Studio, usually `C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe`):

```
keytool -genkeypair -v -keystore C:\Users\phili\njia-keys\njia-upload.jks -alias upload -keyalg RSA -keysize 2048 -validity 9125
```

## 2. Tell the build where the key is

Create `app/android/key.properties` (ignored by git, see `app/android/.gitignore`):

```
storeFile=C:\\Users\\phili\\njia-keys\\njia-upload.jks
storePassword=…
keyAlias=upload
keyPassword=…
```

`app/android/app/build.gradle.kts` signs release builds with this key when the file exists, and falls back to the
debug key when it does not (such a build cannot be uploaded to Play).

## 3. Build

```
cd app
flutter build appbundle --release
```

Output: `app/build/app/outputs/bundle/release/app-release.aab`. Bump `version:` in `app/pubspec.yaml` for every upload
(`1.0.0+1` → `1.0.1+2`; the number after `+` must always increase).

## 4. Google sign-in on Android (Firebase)

Google sign-in checks the SHA-1 of the certificate the app is signed with. Two fingerprints are needed:

1. **Upload key** – `keytool -list -v -keystore C:\Users\phili\njia-keys\njia-upload.jks -alias upload` → copy SHA-1.
2. **Play app signing key** – after the first upload: Play Console → Test and release → App integrity → App signing → SHA-1.

Add both in Firebase Console → `njia-prod` → Project settings → Your apps → Android `com.revana.njia` → Add fingerprint.
Njia has no `google-services.json` (it uses `lib/firebase_options.dart`), so nothing else needs to change in the repo.

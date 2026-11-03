// Creates (if needed) a Firebase Auth user and gives it the custom claim { role: "admin" }.
// Prints a password-reset link so the person can set their own password.
// Usage: node scripts/make-admin.mjs philipp@example.com [--project njia-prod]
import { initializeApp, applicationDefault } from "firebase-admin/app";
import { getAuth } from "firebase-admin/auth";

const args = process.argv.slice(2);
const email = args.find((a) => a.includes("@"));
if (!email) { console.error("usage: node scripts/make-admin.mjs <email> [--project id]"); process.exit(1); }
const projectId = args.includes("--project") ? args[args.indexOf("--project") + 1] : process.env.GCLOUD_PROJECT || "njia-prod";

initializeApp({ credential: applicationDefault(), projectId });
const auth = getAuth();

let user;
try { user = await auth.getUserByEmail(email); console.log("user exists:", user.uid); }
catch { user = await auth.createUser({ email, emailVerified: true, displayName: email.split("@")[0] }); console.log("user created:", user.uid); }

await auth.setCustomUserClaims(user.uid, { ...(user.customClaims || {}), role: "admin" });
console.log("claim set: role=admin");
const link = await auth.generatePasswordResetLink(email);
console.log("\nSet a password with this link (valid ~1 hour):\n" + link + "\n");

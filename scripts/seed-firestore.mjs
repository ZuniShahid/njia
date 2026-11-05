// Imports seed/*.json into Firestore. Idempotent (merge: true).
// Usage: GOOGLE_APPLICATION_CREDENTIALS=sa.json node scripts/seed-firestore.mjs [--project njia-prod] [--dry]
// Or against the emulator: FIRESTORE_EMULATOR_HOST=localhost:8080 node scripts/seed-firestore.mjs
// --ids a,b,c imports only those documents (any collection) and leaves everything else untouched –
// use it to add new seed docs without overwriting reviewed content or the sources' check state.
import { readFileSync, readdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { initializeApp, applicationDefault } from "firebase-admin/app";
import { getFirestore, Timestamp } from "firebase-admin/firestore";

const args = process.argv.slice(2);
const dry = args.includes("--dry");
const onlyIds = args.includes("--ids") ? new Set(args[args.indexOf("--ids") + 1].split(",").map((x) => x.trim()).filter(Boolean)) : null;
const projectId = args.includes("--project") ? args[args.indexOf("--project") + 1] : process.env.GCLOUD_PROJECT || "njia-prod";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const seedDir = join(root, "seed");

// ISO strings -> Timestamps for known time fields, so Firestore queries can order by them
const TIME_FIELDS = new Set(["fetchedAt", "verifiedAt", "lastFetchedAt", "lastCheckedAt", "createdAt", "appliedAt", "postedAt", "expireAt", "startedAt", "finishedAt"]);
function convert(v, key) {
  if (v === null || v === undefined) return v;
  if (Array.isArray(v)) return v.map((x) => convert(x));
  if (typeof v === "object") return Object.fromEntries(Object.entries(v).map(([k, x]) => [k, convert(x, k)]));
  if (typeof v === "string" && TIME_FIELDS.has(key) && /^\d{4}-\d{2}-\d{2}T/.test(v)) return Timestamp.fromDate(new Date(v));
  return v;
}

if (!dry) initializeApp({ credential: applicationDefault(), projectId });
const db = dry ? null : getFirestore();

let total = 0;
for (const f of readdirSync(seedDir).filter((f) => f.endsWith(".json"))) {
  const coll = f.replace(".json", "");
  const docs = JSON.parse(readFileSync(join(seedDir, f), "utf8"));
  let batch = dry ? null : db.batch();
  let n = 0;
  for (const doc of docs) {
    const { id, ...body } = doc;
    if (onlyIds && !onlyIds.has(id)) continue;
    const data = { ...convert(body), _seedVersion: "2026-11-02", _updatedAt: dry ? null : Timestamp.now() };
    if (coll === "sources") Object.assign(data, { lastFetchedAt: null, lastCheckedAt: null, lastHash: null, lastStatus: "never" });
    if (!dry) batch.set(db.collection(coll).doc(id), data, { merge: true });
    n++; total++;
    if (!dry && n % 400 === 0) { await batch.commit(); batch = db.batch(); }
  }
  if (!dry && n) await batch.commit();
  if (n || !onlyIds) console.log(`${coll}: ${n} documents${dry ? " (dry run)" : ""}`);
}
console.log(`done: ${total} documents -> ${projectId}`);
if (onlyIds && total !== onlyIds.size) { console.error(`expected ${onlyIds.size} ids, found ${total}`); process.exitCode = 1; }

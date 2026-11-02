// Njia Cloud Functions (Firebase Functions v2, region europe-west1)
//
//  api                     HTTPS   read-only JSON API for web/app (corridor bundles, plan preview)
//  review                  HTTPS   approve/reject link target used in e-mail + WhatsApp (HMAC token)
//  onChangeRequestWritten  trigger applies approved change requests to content + history
//  onGoalWritten           trigger computes users/{uid}/plans/{goalId}
//  computePlan             callable recompute on demand (profile changed, content version changed)
//  setRole                 callable admin grants editor/admin role (custom claims)
//
import { initializeApp } from "firebase-admin/app";
import { getFirestore, FieldValue } from "firebase-admin/firestore";
import { getAuth } from "firebase-admin/auth";
import { onRequest, onCall, HttpsError } from "firebase-functions/v2/https";
import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { timingSafeEqual } from "node:crypto";
import { setGlobalOptions } from "firebase-functions/v2";
import { buildPlan, factsFromProfile } from "./engine.mjs";
import { applyChange } from "./changes.mjs";

initializeApp();
setGlobalOptions({ region: "europe-west1", maxInstances: 10 });
const db = getFirestore();

const CONTENT = ["countries", "corridors", "pathways", "requirements", "residencePermits", "funding", "occupations"];

async function loadContent(countryId) {
  const out = {};
  for (const c of CONTENT) {
    let q = db.collection(c);
    if (countryId && c === "pathways") q = q.where("countryId", "==", countryId);
    if (countryId && c === "residencePermits") q = q.where("countryId", "==", countryId);
    if (countryId && c === "corridors") q = q.where("destination", "==", countryId);
    const snap = await q.get();
    out[c] = snap.docs.map((d) => ({ id: d.id, ...d.data() }));
  }
  const version = (await db.collection("meta").doc("content").get()).data()?.version || "seed";
  return { content: out, version };
}

async function computeAndStore(uid, goalId) {
  const [userSnap, goalSnap] = await Promise.all([db.collection("users").doc(uid).get(), db.collection("users").doc(uid).collection("goals").doc(goalId).get()]);
  if (!goalSnap.exists) return null;
  const user = userSnap.data() || {};
  const goal = { id: goalId, ...goalSnap.data() };
  const { content, version } = await loadContent(goal.countryId);
  const plan = buildPlan({ goal, profile: { ...user, facts: factsFromProfile(user) }, content });
  await db.collection("users").doc(uid).collection("plans").doc(goalId).set({ ...plan, contentVersion: version, computedAt: FieldValue.serverTimestamp() });
  return plan;
}

// ---------- API ----------
export const api = onRequest({ cors: true }, async (req, res) => {
  const path = req.path.replace(/^\/api/, "");
  res.set("Cache-Control", "public, max-age=300");
  try {
    if (req.method === "GET" && path === "/v1/health") return res.json({ ok: true, time: new Date().toISOString() });
    let m;
    if (req.method === "GET" && (m = path.match(/^\/v1\/corridors\/([A-Z]{2}-[A-Z]{2})$/))) {
      const [origin, destination] = m[1].split("-");
      const corridor = await db.collection("corridors").doc(m[1]).get();
      if (!corridor.exists) return res.status(404).json({ error: "corridor not found" });
      const [country, permits, pathways, funding, alerts] = await Promise.all([
        db.collection("countries").doc(destination).get(),
        db.collection("residencePermits").where("countryId", "==", destination).get(),
        db.collection("pathways").where("countryId", "==", destination).where("status", "==", "published").get(),
        db.collection("funding").where("countryIds", "array-contains", destination).get(),
        db.collection("trustAlerts").get(),
      ]);
      const reqIds = new Set();
      for (const s of [permits, pathways, funding]) for (const d of s.docs) for (const r of d.data().requirementIds || []) reqIds.add(r);
      const reqs = reqIds.size ? await db.getAll(...[...reqIds].map((id) => db.collection("requirements").doc(id))) : [];
      return res.json({
        origin, destination,
        corridor: { id: corridor.id, ...corridor.data() },
        country: { id: country.id, ...country.data() },
        residencePermits: permits.docs.map((d) => ({ id: d.id, ...d.data() })),
        pathways: pathways.docs.map((d) => ({ id: d.id, ...d.data() })),
        funding: funding.docs.filter((d) => { const n = d.data().eligibility?.nationalities || []; return n.includes(origin) || n.some((x) => String(x).startsWith("any")); }).map((d) => ({ id: d.id, ...d.data() })),
        requirements: reqs.filter((d) => d.exists).map((d) => ({ id: d.id, ...d.data() })),
        trustAlerts: alerts.docs.map((d) => ({ id: d.id, ...d.data() })).filter((a) => !a.countryIds?.length || a.countryIds.includes(destination)),
      });
    }
    if (req.method === "POST" && path === "/v1/plan/preview") {
      // anonymous preview: body = { goal, profile }
      res.set("Cache-Control", "no-store");
      const { goal, profile } = req.body || {};
      if (!goal?.countryId) return res.status(400).json({ error: "goal.countryId required" });
      const { content, version } = await loadContent(goal.countryId);
      const plan = buildPlan({ goal, profile: { ...(profile || {}), facts: factsFromProfile(profile || {}) }, content });
      return res.json({ ...plan, contentVersion: version });
    }
    return res.status(404).json({ error: "not found" });
  } catch (e) {
    console.error(e);
    return res.status(500).json({ error: "internal" });
  }
});

// ---------- Review link (e-mail / WhatsApp) ----------
// The link carries the per-request token that n8n stored in changeRequests/{id}.approvalToken (no shared secret needed).
export const review = onRequest(async (req, res) => {
  const { id, d: decision, t: token } = req.query;
  const html = (title, body) => res.status(200).set("Content-Type", "text/html").send(`<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width"><title>${title}</title><body style="font-family:system-ui;max-width:560px;margin:40px auto;padding:0 16px"><h2>${title}</h2><p>${body}</p></body>`);
  if (!id || !["approve", "reject"].includes(decision) || !token) return html("Link ungültig", "Dieser Prüf-Link ist unvollständig.");
  const ref = db.collection("changeRequests").doc(String(id));
  const snap = await ref.get();
  if (!snap.exists) return html("Nicht gefunden", "Diese Änderung existiert nicht mehr.");
  const stored = String(snap.data().approvalToken || "");
  const a = Buffer.from(stored), b = Buffer.from(String(token));
  if (!stored || a.length !== b.length || !timingSafeEqual(a, b)) return html("Link ungültig", "Dieser Prüf-Link ist ungültig.");
  if (snap.data().status !== "pending") return html("Bereits entschieden", `Status: ${snap.data().status}.`);
  await ref.update({ status: decision === "approve" ? "approved" : "rejected", reviewer: { uid: null, channel: "email", decidedAt: FieldValue.serverTimestamp(), note: "via review link" } });
  return html(decision === "approve" ? "Freigegeben" : "Abgelehnt", `Änderung <code>${id}</code> an <code>${snap.data().targetCollection}/${snap.data().targetId}</code> wurde ${decision === "approve" ? "freigegeben und wird jetzt übernommen" : "abgelehnt"}.`);
});

// ---------- Apply approved changes ----------
export const onChangeRequestWritten = onDocumentWritten("changeRequests/{id}", async (event) => {
  const after = event.data?.after?.data();
  if (!after || after.status !== "approved") return;
  try {
    await applyChange(db, event.params.id);
  } catch (e) {
    console.error("apply failed", e);
    await db.collection("changeRequests").doc(event.params.id).update({ status: "failed", error: String(e.message || e) });
  }
});

// ---------- Plans ----------
export const onGoalWritten = onDocumentWritten("users/{uid}/goals/{goalId}", async (event) => {
  if (!event.data?.after?.exists) { await db.collection("users").doc(event.params.uid).collection("plans").doc(event.params.goalId).delete(); return; }
  await computeAndStore(event.params.uid, event.params.goalId);
});

export const computePlan = onCall(async (req) => {
  if (!req.auth) throw new HttpsError("unauthenticated", "sign in");
  const { goalId } = req.data || {};
  if (!goalId) throw new HttpsError("invalid-argument", "goalId required");
  const plan = await computeAndStore(req.auth.uid, goalId);
  if (!plan) throw new HttpsError("not-found", "goal not found");
  return plan;
});

// ---------- Roles ----------
export const setRole = onCall(async (req) => {
  if (req.auth?.token?.role !== "admin") throw new HttpsError("permission-denied", "admin only");
  const { uid, role } = req.data || {};
  if (!uid || !["editor", "admin", null].includes(role)) throw new HttpsError("invalid-argument", "uid and role (editor|admin|null)");
  await getAuth().setCustomUserClaims(uid, role ? { role } : {});
  await db.collection("users").doc(uid).set({ roles: role ? [role] : [] }, { merge: true });
  return { ok: true };
});

// Approval queue helpers: HMAC tokens for approve/reject links and applying an approved change.
import { createHmac, timingSafeEqual } from "node:crypto";
import { FieldValue } from "firebase-admin/firestore";

export function signToken(secret, changeId, decision) {
  return createHmac("sha256", secret).update(`${changeId}:${decision}`).digest("base64url");
}
export function verifyToken(secret, changeId, decision, token) {
  const expected = signToken(secret, changeId, decision);
  const a = Buffer.from(expected), b = Buffer.from(String(token || ""));
  return a.length === b.length && timingSafeEqual(a, b);
}

/** Shallow-merge `after` into the target doc, keep history, mark the change applied. Runs in a transaction. */
export async function applyChange(db, changeId) {
  const ref = db.collection("changeRequests").doc(changeId);
  return db.runTransaction(async (tx) => {
    const snap = await tx.get(ref);
    if (!snap.exists) throw new Error(`changeRequest ${changeId} not found`);
    const cr = snap.data();
    if (cr.status !== "approved") return { skipped: true, status: cr.status };
    const target = db.collection(cr.targetCollection).doc(cr.targetId);
    const targetSnap = await tx.get(target);
    const now = FieldValue.serverTimestamp();
    const provenance = {
      ...(cr.after?.provenance || targetSnap.data()?.provenance || {}),
      sourceId: cr.sourceId,
      sourceUrl: cr.evidence?.url || null,
      quote: cr.evidence?.quote || null,
      fetchedAt: cr.evidence?.fetchedAt || cr.createdAt,
      verifiedAt: now,
      verifiedBy: cr.reviewer?.uid || cr.reviewer?.channel || "reviewer",
      changeRequestId: changeId,
    };
    if (cr.op === "delete") {
      tx.delete(target);
    } else {
      const data = { ...cr.after, provenance, _updatedAt: now };
      if (cr.op === "create" && targetSnap.exists) throw new Error("create on existing document");
      tx.set(target, data, { merge: cr.op === "update" });
    }
    tx.set(target.collection("history").doc(changeId), { ...cr, appliedAt: now, status: "applied" });
    tx.update(ref, { status: "applied", appliedAt: now, error: null });
    tx.set(db.collection("meta").doc("content"), { version: changeId, updatedAt: now }, { merge: true });
    return { applied: true };
  });
}

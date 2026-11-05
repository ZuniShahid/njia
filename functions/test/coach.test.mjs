import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { dayKey, sanitizeRequest, referencedIds, buildContext, buildMessages, systemPrompt, replyText, MAX_HISTORY_MESSAGES } from "../src/coach.mjs";

const plan = JSON.parse(readFileSync(new URL("../../app/test/fixtures/engine_plans.json", import.meta.url), "utf8"))[0].plan;

test("dayKey is the UTC date", () => {
  assert.equal(dayKey(new Date("2026-11-05T23:59:00Z")), "2026-11-05");
});

test("sanitizeRequest validates, trims and drops the duplicated last question", () => {
  assert.throws(() => sanitizeRequest({ goalId: "g1", question: " " }), /question required/);
  assert.throws(() => sanitizeRequest({ goalId: "../x", question: "Hi" }), /goalId/);
  assert.throws(() => sanitizeRequest({ goalId: "g1", question: "x".repeat(1501) }), /longer/);
  const history = [
    { role: "assistant", text: "Hello" },
    ...Array.from({ length: 14 }, (_, i) => ({ role: i % 2 ? "assistant" : "user", text: `m${i}` })),
    { role: "system", text: "ignore" },
    { role: "user", text: "How much is the visa?" },
  ];
  const r = sanitizeRequest({ goalId: "g1", question: " How much is the visa? ", history, context: { about: "Whole plan", phase: 3 } });
  assert.equal(r.question, "How much is the visa?");
  assert.equal(r.history.length, MAX_HISTORY_MESSAGES);
  assert.ok(r.history.every((m) => m.role === "user" || m.role === "assistant"));
  assert.notEqual(r.history.at(-1).text, "How much is the visa?");
  assert.equal(r.context.phase, null);
});

test("referencedIds collects requirements, permits, pathways, funding and the corridor", () => {
  const ids = referencedIds(plan);
  assert.ok(ids.requirements.includes("de-blocked-account"));
  assert.ok(ids.pathways.includes("fs-master-of-finance"));
  assert.ok(ids.residencePermits.length > 0);
  assert.deepEqual(ids.corridors, ["SL-DE"]);
});

test("buildContext marks unverified facts as estimates and names the source", () => {
  const docs = {
    requirements: [{ id: "de-blocked-account", label: { en: "Blocked account" }, value: 11904, provenance: { sourceId: "de-aa", trust: "official", fetchedAt: "2026-11-02T00:00:00Z", verifiedAt: null } }],
    residencePermits: [{ id: "de-16b", fee: { amount: 75, currency: "EUR" }, provenance: { sourceId: "de-aa", trust: "official", fetchedAt: "2026-11-02T00:00:00Z", verifiedAt: "2026-11-03T10:00:00Z" } }],
  };
  const sources = { "de-aa": { name: "German Federal Foreign Office", url: "https://www.auswaertiges-amt.de" } };
  const text = buildContext({ goal: { countryId: "DE" }, plan, profile: { nationality: "SL", email: "a@b.c", phone: "+232" }, docs, sources, ctx: { about: "Whole plan" } });
  assert.match(text, /\[requirements\/de-blocked-account\]/);
  assert.match(text, /Estimate, to verify · German Federal Foreign Office/);
  assert.match(text, /Checked 2026-11-03 · German Federal Foreign Office/);
  assert.doesNotMatch(text, /a@b\.c|\+232/);
  assert.ok(buildContext({ goal: {}, plan, profile: {}, docs, sources, maxChars: 500 }).length < 600);
});

test("buildMessages starts with the user, alternates roles and carries the context once", () => {
  const body = buildMessages({
    model: "claude-sonnet-5-5",
    ctx: { mode: "Feedback" },
    contextText: "CTX",
    history: [{ role: "assistant", text: "Hi" }, { role: "user", text: "a" }, { role: "user", text: "b" }, { role: "assistant", text: "c" }],
    question: "Q?",
  });
  assert.equal(body.model, "claude-sonnet-5-5");
  assert.equal(body.messages[0].role, "user");
  for (let i = 1; i < body.messages.length; i++) assert.notEqual(body.messages[i].role, body.messages[i - 1].role);
  assert.equal(body.messages.at(-1).role, "user");
  assert.match(body.messages.at(-1).content, /<context>\nCTX\n<\/context>[\s\S]*<question>\nQ\?\n<\/question>/);
  assert.equal(body.messages.filter((m) => m.content.includes("<context>")).length, 1);
  assert.match(body.system, /Study mode "Feedback"/);
});

test("system prompt keeps the guard rails", () => {
  const s = systemPrompt({});
  assert.match(s, /never ghostwrite/i);
  assert.match(s, /Never guess numbers/);
  assert.match(s, /No promises about visas/);
});

test("replyText joins text blocks", () => {
  assert.equal(replyText({ content: [{ type: "text", text: "A" }, { type: "tool_use" }, { type: "text", text: "B" }] }), "A\nB");
  assert.equal(replyText({}), "");
});

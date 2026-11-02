import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { buildPlan, evaluateRequirement, factsFromProfile } from "../src/engine.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "../..");
const load = (c) => JSON.parse(readFileSync(join(root, "seed", `${c}.json`), "utf8"));
const content = Object.fromEntries(["countries", "corridors", "pathways", "requirements", "residencePermits", "funding", "occupations"].map((c) => [c, load(c)]));

test("CEFR comparison works for >=", () => {
  const req = { id: "german-b1", key: "language.de.cefr", operator: ">=", value: "B1" };
  assert.equal(evaluateRequirement(req, { "language.de.cefr": "B2" }).status, "met");
  assert.equal(evaluateRequirement(req, { "language.de.cefr": "A2" }).status, "gap");
  assert.equal(evaluateRequirement(req, {}).status, "unknown");
});

test("profile flattening", () => {
  const f = factsFromProfile({ languages: [{ lang: "en", test: "IELTS", score: "6.5" }], education: [{ isced: "6", status: "completed", grade: "second_upper" }], experienceMonths: 3, savings: { amount: 2000, currency: "EUR" } });
  assert.equal(f["language.en.ielts"], 6.5);
  assert.equal(f["education.maxIsced"], 6);
  assert.equal(f["education.bachelor.classification"], "second_upper");
  assert.equal(f["funds.eur"], 2000);
});

test("plan Sierra Leone -> Deutsche Bank via Frankfurt School", () => {
  const profile = { nationality: "SL", facts: { "language.en.ielts": 6.5, "education.maxIsced": 6, "experienceMonths": 3, "documents.passport.valid": true }, savings: { amount: 3000, currency: "EUR" } };
  const goal = { id: "g1", occupationId: "isco-2413", countryId: "DE", targetYear: 2032, pathwayIds: ["fs-master-of-finance", "db-graduate-programme"] };
  const plan = buildPlan({ goal, profile, content, now: new Date("2026-11-02") });
  assert.equal(plan.corridorId, "SL-DE");
  assert.deepEqual(plan.pathwayIds, ["fs-master-of-finance", "db-graduate-programme"]);
  assert.ok(plan.gaps.some((g) => g.requirementId === "de-blocked-account"), "blocked account is a gap");
  assert.ok(plan.steps.some((s) => s.kind === "visa" && s.permitId === "DE-student"), "student visa step present");
  assert.ok(plan.steps.find((s) => s.kind === "visa" && s.permitId === "DE-student").applyAt.city === "Accra");
  assert.ok(plan.costs.some((c) => c.kind === "tuition" && c.min === 42000));
  assert.ok(plan.scores.readiness > 0 && plan.scores.readiness < 100);
  assert.ok(plan.scores.difficulty >= 1 && plan.scores.difficulty <= 5);
  assert.ok(plan.totalMonths > 24);
  assert.ok(plan.watch.some((w) => w.kind === "visa"));
});

test("inferred pathways when goal has none", () => {
  const goal = { occupationId: "isco-2413", countryId: "HU" };
  const plan = buildPlan({ goal, profile: { nationality: "SL", facts: {} }, content });
  assert.ok(plan.pathwayIds.includes("hu-ba-business-corvinus"));
  assert.equal(plan.corridorId, "SL-HU");
});

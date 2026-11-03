// Writes the JS engine's output for the two plan test cases to app/test/fixtures/engine_plans.json.
// app/test/engine_parity_test.dart compares the Dart port against it – run this after changing engine.mjs.
// Usage: node scripts/engine-fixture.mjs
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { buildPlan } from "../functions/src/engine.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const load = (c) => JSON.parse(readFileSync(join(root, "seed", `${c}.json`), "utf8"));
const content = Object.fromEntries(["countries", "corridors", "pathways", "requirements", "residencePermits", "funding", "occupations"].map((c) => [c, load(c)]));
const now = new Date("2026-11-02");

export const cases = [
  {
    name: "SL -> Deutsche Bank via Frankfurt School",
    goal: { id: "g1", occupationId: "isco-2413", countryId: "DE", targetYear: 2032, pathwayIds: ["fs-master-of-finance", "db-graduate-programme"] },
    profile: { nationality: "SL", facts: { "language.en.ielts": 6.5, "education.maxIsced": 6, experienceMonths: 3, "documents.passport.valid": true }, savings: { amount: 3000, currency: "EUR" } },
  },
  {
    name: "inferred pathways HU",
    goal: { occupationId: "isco-2413", countryId: "HU" },
    profile: { nationality: "SL", facts: {} },
  },
];

const out = cases.map((c) => ({ ...c, now: now.toISOString(), plan: buildPlan({ goal: c.goal, profile: c.profile, content, now }) }));
const file = join(root, "app/test/fixtures/engine_plans.json");
mkdirSync(dirname(file), { recursive: true });
writeFileSync(file, JSON.stringify(out, null, 1) + "\n");
console.log(`wrote ${file} (${out.length} cases)`);

// Njia planning engine – pure functions, no Firebase imports, so it runs in Cloud Functions,
// in tests and (ported) in Flutter. Input: content documents + user profile + goal. Output: plan + scores.

const CEFR = ["A1", "A2", "B1", "B2", "C1", "C2"];
const cefrIdx = (v) => CEFR.indexOf(String(v).toUpperCase());

/** Evaluate one requirement against profile facts. facts = flat map like {"language.en.ielts": 6.5}. */
export function evaluateRequirement(req, facts) {
  const have = facts?.[req.key];
  if (have === undefined || have === null) return { id: req.id, status: "unknown" };
  const want = req.value;
  let met;
  switch (req.operator) {
    case "exists": met = !!have; break;
    case "==": met = have === want; break;
    case "in": met = Array.isArray(want) && want.includes(have); break;
    case ">=":
    case "<=": {
      const isCefr = typeof want === "string" && CEFR.includes(want.toUpperCase());
      const a = isCefr ? cefrIdx(have) : Number(have);
      const b = isCefr ? cefrIdx(want) : Number(want);
      if (Number.isNaN(a) || a < 0) return { id: req.id, status: "unknown" };
      met = req.operator === ">=" ? a >= b : a <= b;
      break;
    }
    default: return { id: req.id, status: "unknown" };
  }
  return { id: req.id, status: met ? "met" : "gap" };
}

/** Readiness 0–100 for a set of requirement ids. unknown counts half. */
export function readinessScore(reqIds, reqById, facts) {
  const results = reqIds.map((id) => reqById[id]).filter(Boolean).map((r) => evaluateRequirement(r, facts));
  if (!results.length) return { score: 100, results };
  const pts = results.reduce((s, r) => s + (r.status === "met" ? 1 : r.status === "unknown" ? 0.5 : 0), 0);
  return { score: Math.round((100 * pts) / results.length), results };
}

const PHASE_ORDER = ["test", "language_course", "course", "bachelor", "vocational", "master", "phd", "internship", "trainee", "job"];
const monthsOf = (p) => p.durationMonths || (p.type === "test" ? 1 : 12);

/** Pick the pathways that form the route to the goal. Explicit goal.pathwayIds win; otherwise infer. */
export function selectPathways(goal, content) {
  const all = content.pathways.filter((p) => p.status !== "withdrawn");
  if (goal.pathwayIds?.length) return goal.pathwayIds.map((id) => all.find((p) => p.id === id)).filter(Boolean);
  const inCountry = all.filter((p) => p.countryId === goal.countryId);
  const leads = inCountry.filter((p) => (p.leadsToOccupationIds || []).includes(goal.occupationId));
  // prefer one study pathway + one job/trainee pathway
  const study = leads.find((p) => ["master", "bachelor", "vocational"].includes(p.type)) || inCountry.find((p) => ["master", "bachelor"].includes(p.type));
  const work = leads.find((p) => ["trainee", "job"].includes(p.type));
  return [study, work].filter(Boolean);
}

/**
 * Build the plan: phases, steps (with month offsets), costs, requirement gaps, scores.
 * content = { countries, corridors, pathways, requirements, residencePermits, funding, occupations }
 */
export function buildPlan({ goal, profile, content, now = new Date() }) {
  const reqById = Object.fromEntries(content.requirements.map((r) => [r.id, r]));
  const permitById = Object.fromEntries(content.residencePermits.map((r) => [r.id, r]));
  const fundingById = Object.fromEntries(content.funding.map((r) => [r.id, r]));
  const facts = profile.facts || {};
  const origin = profile.nationality || "SL";
  const corridor = content.corridors.find((c) => c.origin === origin && c.destination === goal.countryId) || null;
  const country = content.countries.find((c) => c.id === goal.countryId) || null;

  const pathways = selectPathways(goal, content).sort((a, b) => PHASE_ORDER.indexOf(a.type) - PHASE_ORDER.indexOf(b.type));
  const steps = [];
  let month = 0;
  const pushStep = (s) => { steps.push({ order: steps.length + 1, startMonth: month, ...s }); };

  // 1. Preparation: every requirement of the first pathway that is a gap or unknown
  const neededReqIds = new Set();
  for (const p of pathways) for (const r of p.requirementIds || []) neededReqIds.add(r);
  const firstPermit = pathways[0]?.unlocksPermitIds?.map((id) => permitById[id]).find((p) => p && p.type === "student");
  if (firstPermit) for (const r of firstPermit.requirementIds || []) neededReqIds.add(r);
  const evals = [...neededReqIds].map((id) => reqById[id]).filter(Boolean).map((r) => ({ ...evaluateRequirement(r, facts), req: r }));
  const gaps = evals.filter((e) => e.status !== "met");
  for (const g of gaps) {
    const dur = g.req.type === "language_test" && g.req.cefr && cefrIdx(g.req.cefr) >= 3 ? 9 : g.req.type === "language_test" ? 4 : g.req.type === "funds" ? 6 : 2;
    pushStep({ kind: "prepare", title: g.req.label?.en || g.req.id, requirementId: g.req.id, durationMonths: dur, status: g.status, howToMeet: g.req.howToMeet?.en || null, providerTypes: g.req.providerTypes || [] });
  }
  month += gaps.length ? Math.max(...gaps.map((_, i) => steps[i].durationMonths)) : 0; // preparation runs in parallel

  // 2. Pathways in order, each with admission + permit + study/work block
  const costs = [];
  for (const p of pathways) {
    const fundingOpts = (p.fundingIds || []).map((id) => fundingById[id]).filter(Boolean);
    pushStep({ kind: "apply", title: `Apply: ${p.title}`, pathwayId: p.id, durationMonths: 3, deadline: p.applicationDeadline || null, funding: fundingOpts.map((f) => ({ id: f.id, name: f.name, difficulty: f.difficulty, closes: f.applicationWindow?.closes || null })) });
    month += 3;
    const permits = (p.unlocksPermitIds || []).map((id) => permitById[id]).filter(Boolean);
    const entryPermit = permits.find((x) => ["student", "work", "blue_card", "trainee"].includes(x.type));
    if (entryPermit) {
      const weeks = entryPermit.processingWeeks?.max || 8;
      pushStep({ kind: "visa", title: entryPermit.name?.en || entryPermit.id, permitId: entryPermit.id, durationMonths: Math.ceil(weeks / 4), applyAt: corridor?.visaApplication || null, checklist: entryPermit.checklist || [], fee: entryPermit.fee || null, fundsProof: entryPermit.fundsProof || null });
      month += Math.ceil(weeks / 4);
      if (entryPermit.fee) costs.push({ label: `${entryPermit.name?.en || entryPermit.id} fee`, ...entryPermit.fee, kind: "fee", month });
    }
    const dur = monthsOf(p);
    pushStep({ kind: p.type === "job" || p.type === "trainee" ? "work" : "study", title: p.title, pathwayId: p.id, durationMonths: dur, institution: p.institution || null, city: p.city || null });
    if (p.tuition && p.tuition.max > 0) {
      const years = p.tuition.period === "once" ? 1 : Math.max(1, Math.round(dur / 12));
      costs.push({ label: `Tuition: ${p.title}`, min: p.tuition.min * years, max: p.tuition.max * years, currency: p.tuition.currency, kind: "tuition", month });
    }
    if (country?.livingCostMonthly && p.type !== "job" && p.type !== "trainee" && p.type !== "test" && p.mode !== "online") {
      costs.push({ label: `Living costs ${country.name?.en} (${dur} months)`, min: country.livingCostMonthly.min * dur, max: country.livingCostMonthly.max * dur, currency: country.livingCostMonthly.currency, kind: "living", month });
    }
    month += dur;
    const follow = permits.find((x) => x.type === "job_seeker");
    if (follow && p.type !== "job") pushStep({ kind: "visa", title: follow.name?.en || follow.id, permitId: follow.id, durationMonths: follow.durationMonths || 12, note: "Time to find a job after graduation" });
  }

  // 3. Scores
  const readiness = readinessScore([...neededReqIds], reqById, facts).score;
  const fundingDiff = pathways.flatMap((p) => (p.fundingIds || []).map((id) => fundingById[id]?.difficulty)).filter(Boolean);
  const difficulty = clamp(
    0.4 * (corridor?.scoreBase?.difficulty || 3) + 0.3 * (fundingDiff.length ? Math.min(...fundingDiff) : 3) + 0.3 * Math.min(5, 1 + gaps.length / 2),
    1, 5);
  const totalMinEur = costs.filter((c) => c.currency === "EUR").reduce((s, c) => s + (c.min ?? c.amount ?? 0), 0);
  const savings = profile.savings?.currency === "EUR" ? profile.savings.amount : 0;
  const support = profile.monthlySupport?.currency === "EUR" ? profile.monthlySupport.amount * Math.max(month, 1) : 0;
  const coverage = totalMinEur ? clamp((savings + support) / totalMinEur, 0, 1) : 1;
  const yearsLeft = goal.targetYear ? goal.targetYear - now.getFullYear() : null;
  const timeFit = yearsLeft === null ? 1 : clamp((yearsLeft * 12) / Math.max(month, 1), 0, 1);
  const realism = Math.round(100 * (0.4 * readiness / 100 + 0.25 * (1 - (difficulty - 1) / 4) + 0.2 * coverage + 0.15 * timeFit));

  return {
    goalId: goal.id || null,
    corridorId: corridor?.id || null,
    pathwayIds: pathways.map((p) => p.id),
    steps,
    totalMonths: month,
    costs,
    gaps: gaps.map((g) => ({ requirementId: g.req.id, status: g.status, label: g.req.label?.en })),
    scores: { readiness, difficulty: Math.round(difficulty * 10) / 10, realism, financeCoverage: Math.round(coverage * 100) },
    watch: watchItems({ corridor, country, pathways, fundingById, now }),
    computedAt: now.toISOString(),
  };
}

function watchItems({ corridor, country, pathways, fundingById, now }) {
  const items = [];
  if (corridor?.visaApplication?.travelRequired) items.push({ kind: "visa", text: `Visa applications are lodged in ${corridor.visaApplication.city} (${corridor.visaApplication.country}); plan travel and an appointment.` });
  if (country?.languages?.length && !country.languages.includes("en")) items.push({ kind: "language", text: `Daily life in ${country.name?.en} runs in ${country.languages[0]}; English-taught programmes still expect basics.` });
  for (const p of pathways) for (const id of p.fundingIds || []) {
    const f = fundingById[id];
    const closes = f?.applicationWindow?.closes;
    if (closes && new Date(closes) > now && (new Date(closes) - now) / 864e5 < 120) items.push({ kind: "deadline", text: `${f.name} closes on ${closes}.`, fundingId: id });
  }
  return items;
}

const clamp = (v, lo, hi) => Math.min(hi, Math.max(lo, v));

/** Flatten a user profile document into the facts map requirements are matched against. */
export function factsFromProfile(user) {
  const facts = { ...(user.facts || {}) };
  for (const l of user.languages || []) {
    if (l.cefr) facts[`language.${l.lang}.cefr`] = l.cefr;
    if (l.test === "IELTS" && l.score) facts["language.en.ielts"] = Number(l.score);
  }
  const edu = user.education || [];
  const done = edu.filter((e) => e.status === "completed");
  if (done.length) facts["education.maxIsced"] = Math.max(...done.map((e) => Number(e.isced)));
  const wassce = edu.find((e) => /wassce/i.test(e.gradeScale || ""));
  if (wassce?.grade) facts["education.wassce.credits"] = Number(wassce.grade);
  const bach = done.find((e) => Number(e.isced) === 6);
  if (bach?.grade) facts["education.bachelor.classification"] = bach.grade;
  if (user.experienceMonths !== undefined) facts["experienceMonths"] = user.experienceMonths;
  if (user.savings?.currency === "EUR") facts["funds.eur"] = user.savings.amount;
  if (user.savings?.currency === "GBP") facts["funds.gbp"] = user.savings.amount;
  return facts;
}

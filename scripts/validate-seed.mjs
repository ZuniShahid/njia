// Validates seed/*.json against schema/njia.schema.json and checks referential integrity.
// Usage: node scripts/validate-seed.mjs
import { readFileSync, readdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import Ajv2020 from "ajv/dist/2020.js";
import addFormats from "ajv-formats";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const schema = JSON.parse(readFileSync(join(root, "schema/njia.schema.json"), "utf8"));
const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats(ajv);
ajv.addSchema({ $id: schema.$id, $defs: schema.$defs });

const seedDir = join(root, "seed");
const data = {};
for (const f of readdirSync(seedDir).filter((f) => f.endsWith(".json"))) {
  data[f.replace(".json", "")] = JSON.parse(readFileSync(join(seedDir, f), "utf8"));
}

let errors = 0;
const ids = {};
for (const [coll, docs] of Object.entries(data)) {
  const collSchema = schema.collections[coll];
  if (!collSchema) { console.error(`! no schema for collection ${coll}`); errors++; continue; }
  const validate = ajv.compile({ ...collSchema, $id: undefined, docId: undefined, subcollections: undefined, $ref: undefined, $defs: schema.$defs });
  ids[coll] = new Set();
  for (const doc of docs) {
    if (!doc.id) { console.error(`! ${coll}: document without id`); errors++; continue; }
    if (ids[coll].has(doc.id)) { console.error(`! ${coll}/${doc.id}: duplicate id`); errors++; }
    ids[coll].add(doc.id);
    const { id, ...body } = doc;
    if (!validate(body)) {
      errors++;
      console.error(`! ${coll}/${id}:`);
      for (const e of validate.errors) console.error(`    ${e.instancePath || "/"} ${e.message}`);
    }
  }
}

// referential integrity
const ref = (coll, id, from) => {
  if (!ids[coll] || !ids[coll].has(id)) { console.error(`! ${from} -> ${coll}/${id} does not exist`); errors++; }
};
for (const c of data.countries) ref("sources", c.provenance.sourceId, `countries/${c.id}`);
for (const c of data.corridors) {
  ref("countries", c.origin, `corridors/${c.id}`); ref("countries", c.destination, `corridors/${c.id}`); ref("sources", c.provenance.sourceId, `corridors/${c.id}`);
}
for (const p of data.pathways) {
  ref("countries", p.countryId, `pathways/${p.id}`); ref("sources", p.provenance.sourceId, `pathways/${p.id}`);
  for (const r of p.requirementIds) ref("requirements", r, `pathways/${p.id}.requirementIds`);
  for (const r of p.fundingIds || []) ref("funding", r, `pathways/${p.id}.fundingIds`);
  for (const r of p.leadsToOccupationIds || []) ref("occupations", r, `pathways/${p.id}.leadsToOccupationIds`);
  for (const r of p.unlocksPermitIds || []) ref("residencePermits", r, `pathways/${p.id}.unlocksPermitIds`);
}
for (const p of data.residencePermits) {
  ref("countries", p.countryId, `residencePermits/${p.id}`); ref("sources", p.provenance.sourceId, `residencePermits/${p.id}`);
  for (const r of p.requirementIds) ref("requirements", r, `residencePermits/${p.id}.requirementIds`);
  for (const r of p.followOnPermitIds || []) ref("residencePermits", r, `residencePermits/${p.id}.followOnPermitIds`);
}
for (const f of data.funding) {
  for (const c of f.countryIds) ref("countries", c, `funding/${f.id}.countryIds`);
  for (const r of f.requirementIds || []) ref("requirements", r, `funding/${f.id}.requirementIds`);
  ref("sources", f.provenance.sourceId, `funding/${f.id}`);
}
for (const r of data.requirements) ref("sources", r.provenance.sourceId, `requirements/${r.id}`);
for (const o of data.occupations) for (const b of o.salaryBands || []) { ref("countries", b.countryId, `occupations/${o.id}.salaryBands`); ref("sources", b.provenance.sourceId, `occupations/${o.id}.salaryBands`); }
for (const p of data.providers) for (const s of p.services || []) ref("requirements", s, `providers/${p.id}.services`);
for (const s of data.sources) for (const t of s.targets) if (t.docId !== "*") ref(t.collection, t.docId, `sources/${s.id}.targets`);
for (const c of data.countries) if (c.postStudyWork?.permitId) ref("residencePermits", c.postStudyWork.permitId, `countries/${c.id}.postStudyWork`);

const counts = Object.fromEntries(Object.entries(data).map(([k, v]) => [k, v.length]));
console.log("documents:", counts);
if (errors) { console.error(`${errors} problem(s)`); process.exit(1); }
console.log("seed OK");

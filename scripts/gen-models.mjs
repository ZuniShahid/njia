// Generates Dart freezed/json_serializable models from schema/njia.schema.json.
// Usage: node scripts/gen-models.mjs   (then: cd app && dart run build_runner build --delete-conflicting-outputs)
// Output: app/lib/core/models/*.dart (one file per collection + common.dart for shared $defs).
// Hand-written exceptions: plans (shape comes from the engine, see app/lib/core/models/plan.dart).
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const schema = JSON.parse(readFileSync(join(root, "schema/njia.schema.json"), "utf8"));
const outDir = join(root, "app/lib/core/models");
mkdirSync(outDir, { recursive: true });

const CLASS_NAMES = {
  countries: "Country", corridors: "Corridor", pathways: "Pathway", requirements: "Requirement",
  residencePermits: "ResidencePermit", funding: "Funding", occupations: "Occupation", jobs: "Job",
  providers: "ServiceProvider", sources: "ContentSource", trustAlerts: "TrustAlert", changeRequests: "ChangeRequest",
  refreshRuns: "RefreshRun", users: "UserProfile", goals: "Goal", plans: "Plan", documents: "UserDocument",
  outcomes: "Outcome",
};
const HAND_WRITTEN = new Set(["plans"]);
const ID_OPTIONAL = new Set(["users", "goals", "documents", "outcomes"]);
// Nicer names for nested objects / arrays of objects / inline enums (default: Parent + Field).
const NESTED_NAMES = {
  "UserProfile.education": "UserEducation", "UserProfile.languages": "UserLanguage", "UserProfile.consents": "UserConsents",
  "UserProfile.experience": "UserExperience", "UserProfile.notifications": "UserNotifications", "UserProfile.helpPreferences": "HelpPreferences",
  "UserProfile.roles": "UserRole", "ResidencePermit.checklist": "PermitChecklistItem", "Occupation.salaryBands": "SalaryBand",
  "Occupation.shortage": "ShortageEntry", "ContentSource.targets": "SourceTarget", "ChangeRequest.diff": "DiffEntry",
  "ChangeRequest.reviewer": "ReviewDecision", "ChangeRequest.evidence": "Evidence", "Funding.covers": "FundingCover",
  "Funding.eligibility": "FundingEligibility", "Funding.applicationWindow": "ApplicationWindow",
  "Corridor.visaApplication": "VisaApplication", "Corridor.schoolLeavingRecognition": "SchoolLeavingRecognition",
  "Corridor.scoreBase": "ScoreBase", "Country.postStudyWork": "PostStudyWork", "Country.recognitionBody": "RecognitionBody",
  "ResidencePermit.processingWeeks": "ProcessingWeeks", "ResidencePermit.workRights": "WorkRights",
  "Requirement.operator": "RequirementOperator", "ServiceProvider.rating": "ProviderRating", "ServiceProvider.contact": "ProviderContact",
};
const ENUM_IDENTIFIERS = { ">=": "gte", "<=": "lte", "==": "eq", "in": "inList" };
const DART_RESERVED = new Set(["in", "is", "as", "default", "new", "class", "enum", "switch", "case", "do", "if", "else", "for", "while", "return", "this", "super", "null", "true", "false", "var", "void", "with"]);

const pascal = (s) => s.replace(/(^|[_\-\s])(\w)/g, (_, __, c) => c.toUpperCase());
const camel = (s) => { const p = pascal(s); return p[0].toLowerCase() + p.slice(1); };
const enumIdent = (v) => {
  if (ENUM_IDENTIFIERS[v]) return ENUM_IDENTIFIERS[v];
  if (/^\d/.test(v)) return `level${v}`;
  const id = camel(String(v));
  return DART_RESERVED.has(id) ? `${id}Value` : id;
};
const singular = (name) => (name.endsWith("ies") ? name.slice(0, -3) + "y" : name.endsWith("s") ? name.slice(0, -1) : name + "Item");

// ---- collected output -------------------------------------------------------------------------
const commonEnums = []; // from $defs
const commonClasses = []; // from $defs
const files = {}; // fileName -> { classes: [], enums: [] }
const sharedEnums = new Map(); // "field:[values]" -> enum name, for identical inline enums in $defs (e.g. money.period)
const commonBucket = { classes: [], enums: [] };

function emitEnum(name, values, doc) {
  const lines = [];
  if (doc) lines.push(`/// ${docText(doc)}`);
  lines.push(`enum ${name} {`);
  for (const v of values) lines.push(`  @JsonValue(${dartStr(v)})\n  ${enumIdent(v)},`);
  lines.push(`}`, ``);
  lines.push(`extension ${name}Json on ${name} {`);
  lines.push(`  /// The wire value as stored in Firestore / the schema.`);
  lines.push(`  String get value => switch (this) {`);
  for (const v of values) lines.push(`        ${name}.${enumIdent(v)} => ${dartStr(v)},`);
  lines.push(`      };`);
  lines.push(`}`);
  return lines.join("\n");
}
// Doc comments: angle brackets would be read as HTML by dartdoc; wrap <placeholders> in backticks.
const docText = (s) => String(s).replace(/\n/g, " ").replace(/<[^>`]+>/g, (m) => `\`${m}\``);
const dartStr = (s) => `'${String(s).replace(/\\/g, "\\\\").replace(/'/g, "\\'").replace(/\$/g, "\\$")}'`;

function refName(ref) {
  const key = ref.split("/").pop();
  return pascal(key);
}

/** Resolve a property schema to a Dart type. May emit nested classes/enums into `bucket`. */
function dartType(prop, ctx) {
  const { ownerClass, field, bucket, required } = ctx;
  const nullable = (t) => (required ? t : `${t}?`);
  if (!prop || Object.keys(prop).length === 0) return { type: "Object?", isDynamic: true };
  if (prop.$ref) {
    const n = refName(prop.$ref);
    const def = schema.$defs[prop.$ref.split("/").pop()];
    if (def?.type === "integer") return { type: nullable("int") };
    return { type: nullable(n), isEnum: !!def?.enum, isClass: !def?.enum };
  }
  if (prop.anyOf) {
    const nonNull = prop.anyOf.find((a) => a.type !== "null");
    const r = dartType(nonNull, { ...ctx, required: true });
    return { ...r, type: r.type.endsWith("?") ? r.type : `${r.type}?`, nullableByAnyOf: true };
  }
  if (prop.enum) {
    const cacheKey = `${field}:${JSON.stringify(prop.enum)}`;
    let n = sharedEnums.get(cacheKey);
    if (!n) {
      n = NESTED_NAMES[`${ownerClass}.${field}`] || `${ownerClass}${pascal(field)}`;
      bucket.enums.push(emitEnum(n, prop.enum, prop.description));
      if (bucket === commonBucket) sharedEnums.set(cacheKey, n); // common.dart is imported everywhere
    }
    return { type: nullable(n), isEnum: true };
  }
  let t = Array.isArray(prop.type) ? prop.type.filter((x) => x !== "null")[0] : prop.type;
  const nullInType = Array.isArray(prop.type) && prop.type.includes("null");
  const nn = (x) => (nullInType ? `${x}?` : nullable(x));
  switch (t) {
    case "string": return { type: nn("String") };
    case "integer": return { type: nn("int") };
    case "number": return { type: nn("double") };
    case "boolean": return { type: nn("bool") };
    case "object": {
      if (!prop.properties) return { type: nn("Map<String, dynamic>"), isMap: true };
      const n = NESTED_NAMES[`${ownerClass}.${field}`] || `${ownerClass}${pascal(field)}`;
      emitClass(n, prop, bucket, { idMode: "none" });
      return { type: nn(n), isClass: true };
    }
    case "array": {
      const items = prop.items || {};
      let inner;
      if (items.enum) {
        const n = NESTED_NAMES[`${ownerClass}.${field}`] || `${ownerClass}${pascal(singular(field))}`;
        bucket.enums.push(emitEnum(n, items.enum, items.description));
        inner = n;
      } else if (items.properties) {
        const n = NESTED_NAMES[`${ownerClass}.${field}`] || `${ownerClass}${pascal(singular(field))}`;
        emitClass(n, items, bucket, { idMode: "none" });
        inner = n;
      } else if (items.$ref) {
        inner = dartType(items, { ...ctx, required: true }).type;
      } else if (items.type) {
        inner = dartType(items, { ...ctx, required: true }).type;
      } else inner = "dynamic";
      return { type: `List<${inner}>`, isList: true, inner };
    }
    default: return { type: "Object?", isDynamic: true };
  }
}

function emitClass(name, node, bucket, { idMode, doc }) {
  const req = new Set(node.required || []);
  const fields = [];
  if (idMode === "required") fields.push({ name: "id", type: "String", required: true, doc: "Firestore document id." });
  if (idMode === "optional") fields.push({ name: "id", type: "String?", required: false, doc: "Firestore document id (null before the doc is created)." });
  for (const [field, prop] of Object.entries(node.properties || {})) {
    const required = req.has(field);
    const r = dartType(prop, { ownerClass: name, field, bucket, required });
    const f = { name: camel(field), json: field, type: r.type, required, doc: prop.description };
    if (r.isList) { f.required = false; f.defaultValue = `[]`; }
    else if (r.type.endsWith("?")) f.required = false;
    else if (required) f.required = true;
    if (r.isEnum && r.type.endsWith("?")) f.unknownEnum = true;
    fields.push(f);
  }
  const lines = [];
  if (doc) lines.push(`/// ${docText(doc)}`);
  lines.push(`@freezed`, `abstract class ${name} with _$${name} {`, `  const factory ${name}({`);
  for (const f of fields) {
    if (f.doc) lines.push(`    /// ${docText(f.doc)}`);
    const ann = [];
    if (f.json && f.json !== f.name) ann.push(`name: ${dartStr(f.json)}`);
    if (f.unknownEnum) ann.push(`unknownEnumValue: JsonKey.nullForUndefinedEnumValue`);
    if (ann.length) lines.push(`    @JsonKey(${ann.join(", ")})`);
    if (f.defaultValue) lines.push(`    @Default(${f.defaultValue}) ${f.type} ${f.name},`);
    else lines.push(`    ${f.required ? "required " : ""}${f.type} ${f.name},`);
  }
  lines.push(`  }) = _${name};`, ``, `  factory ${name}.fromJson(Map<String, dynamic> json) => _$${name}FromJson(json);`, `}`);
  bucket.classes.push(lines.join("\n"));
}

// ---- $defs → common.dart ---------------------------------------------------------------------
for (const [key, def] of Object.entries(schema.$defs)) {
  const name = pascal(key);
  if (def.enum) commonBucket.enums.push(emitEnum(name, def.enum, def.description));
  else if (def.type === "object") emitClass(name, def, commonBucket, { idMode: "none", doc: def.description });
  // integer defs (difficulty) map to int directly
}

// ---- collections -----------------------------------------------------------------------------
function collectionFile(collName, node, fileName) {
  if (HAND_WRITTEN.has(collName)) return;
  const bucket = { classes: [], enums: [] };
  const className = CLASS_NAMES[collName] || pascal(singular(collName));
  const doc = [node.description, node.docId ? `Doc id: ${node.docId}` : null].filter(Boolean).join(" ");
  emitClass(className, node, bucket, { idMode: ID_OPTIONAL.has(collName) ? "optional" : "required", doc });
  files[fileName] = bucket;
}
for (const [collName, node] of Object.entries(schema.collections)) {
  collectionFile(collName, node, snake(CLASS_NAMES[collName] || collName));
  for (const [sub, subNode] of Object.entries(node.subcollections || {})) collectionFile(sub, subNode, snake(CLASS_NAMES[sub] || sub));
}
function snake(s) { return s.replace(/([a-z0-9])([A-Z])/g, "$1_$2").toLowerCase(); }

// ---- write -----------------------------------------------------------------------------------
const header = (file, extraImports = []) => `// GENERATED by scripts/gen-models.mjs from schema/njia.schema.json – do not edit by hand.
// Regenerate: node scripts/gen-models.mjs && (cd app && dart run build_runner build --delete-conflicting-outputs)
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
${extraImports.map((i) => `import '${i}';`).join("\n")}

part '${file}.freezed.dart';
part '${file}.g.dart';
`;
writeFileSync(join(outDir, "common.dart"), [header("common"), ...commonBucket.enums, ...commonBucket.classes].join("\n\n") + "\n");
const written = ["common"];
const commonNames = [...commonBucket.enums, ...commonBucket.classes].map((c) => c.match(/(?:enum|class) (\w+)/)[1]);
for (const [file, b] of Object.entries(files)) {
  const body = [...b.enums, ...b.classes].join("\n\n");
  const usesCommon = commonNames.some((n) => new RegExp(`\\b${n}\\b`).test(body));
  writeFileSync(join(outDir, `${file}.dart`), [header(file, usesCommon ? ["common.dart"] : []), body].join("\n\n") + "\n");
  written.push(file);
}
writeFileSync(join(outDir, "models.dart"), `// GENERATED barrel – see scripts/gen-models.mjs.\n${[...written, "plan"].sort().map((f) => `export '${f}.dart';`).join("\n")}\n`);
console.log(`models: wrote ${written.length} files to app/lib/core/models`);

// ---- seed copy for previews/tests (app/assets/seed) ----------------------------------------------
import { readdirSync, copyFileSync } from "node:fs";
const seedSrc = join(root, "seed"), seedDst = join(root, "app/assets/seed");
mkdirSync(seedDst, { recursive: true });
for (const f of readdirSync(seedSrc).filter((f) => f.endsWith(".json"))) copyFileSync(join(seedSrc, f), join(seedDst, f));
console.log(`seed: copied to app/assets/seed (preview + tests)`);

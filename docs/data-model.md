# Data model (short)

Full field definitions: `schema/njia.schema.json`. Validation: `npm run validate`.

| Collection | Doc id | What | Written by |
|---|---|---|---|
| countries | ISO-2 | destination facts, tuition/living ranges, post-study permit | queue |
| corridors | `SL-DE` | where a Sierra Leonean applies for the visa, recognition note, difficulty prior | queue |
| pathways | slug | study programmes, vocational training, courses, tests, trainee programmes, (jobs as a type too) | queue / partners |
| requirements | slug | one reusable condition (IELTS 6.5, blocked account, anabin H+) with `key/operator/value` matched against `users.facts` | queue |
| residencePermits | `DE-student` | permit type per country: fee, funds proof, work rights, checklist, follow-on permits | queue |
| funding | slug | scholarships, waivers, loans, blocked-account providers; eligibility by nationality/level | queue |
| occupations | `isco-2413` | ISCO/ESCO occupation, salary bands per country (each band has its own provenance), shortage flags | queue |
| jobs | `adzuna-gb-123` | postings from APIs; `expireAt` TTL; no approval | n8n 3 |
| providers | slug | tutors, language schools, test centres; `verification` status; ratings only after booking | self-service + review |
| trustAlerts | slug | scam patterns and safeguards | queue |
| sources | slug | registry: url, cadence, targets (collection/doc/fields), last hash/status | n8n 1 |
| changeRequests | `cr-…` | approval queue: before/after/diff/quote/token/status | n8n 1 → human → function |
| refreshRuns | auto | one per 14-day run | n8n 1 |
| meta/content | fixed | `version` = last applied change id (clients cache by it) | function |
| users/{uid} | uid | profile (contact, education, languages, experience, interests/strengths incl. custom chips, money, mobility, notifications, `activeGoalId`), flattened `facts`; subcollections goals (title/employer/area/city/country/occupation/field/targetYear/salaryTarget/priorities/alternatives/relocate/why), plans (computed), documents, outcomes | user / function |

Provenance (on every content doc and on salary bands):
`{ sourceId, sourceUrl, quote, trust: official|api|partner|editorial|community|estimate, fetchedAt, verifiedAt, verifiedBy, validUntil, changeRequestId }`
UI rule: `trust=official` and `verifiedAt` set → "Checked <date> · <source>"; `estimate` → "Estimate · to verify".

Timestamps: the seed script and Cloud Functions write Firestore Timestamps; n8n writes ISO strings (the Firestore node does not convert). Readers must accept both (`toDate()` or `DateTime.parse`).

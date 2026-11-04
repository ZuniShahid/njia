// Sample data from the prototype (Aminata Kamara, two goals) for previews and widget tests.
// Not real people; never shown in production.
import '../core/models/models.dart';

const sampleUid = 'preview-uid';

const sampleProfile = UserProfile(
  id: sampleUid,
  displayName: 'Aminata Kamara',
  email: 'aminata.kamara@example.com',
  phone: '+232 76 000 000',
  city: 'Freetown',
  nationality: 'SL',
  residenceCountry: 'SL',
  education: [
    UserEducation(isced: Isced.level3, field: 'WASSCE', institution: 'Senior secondary school', year: 2025, status: UserEducationStatus.completed, gradeScale: 'WASSCE credits', grade: '6'),
    UserEducation(isced: Isced.level6, field: 'BSc Accounting & Finance', institution: 'Fourah Bay College (USL)', year: 2030, status: UserEducationStatus.inProgress),
  ],
  languages: [
    UserLanguage(lang: 'en', cefr: Cefr.b2),
    UserLanguage(lang: 'kri', native: true),
    UserLanguage(lang: 'de'),
    UserLanguage(lang: 'fr', cefr: Cefr.a1),
  ],
  experience: [
    UserExperience(role: 'Volunteer maths tutor', where: 'Community school, Freetown · 2024–2025', months: 10),
    UserExperience(role: 'Shop assistant', where: 'Family business · weekends', months: 6),
  ],
  experienceMonths: 16,
  interests: ['Working with numbers', 'Helping people', 'Clear structure', 'Travel'],
  strengths: ['Analytical', 'Persistent', 'Good with people'],
  savings: Money(amount: 2600, currency: 'EUR'),
  monthlySupport: Money(amount: 50, currency: 'EUR', period: MoneyPeriod.month),
  supportSource: 'Family (uncle in Freetown)',
  graduationYear: 2030,
  earliestMoveYear: 2030,
  preferredCountryIds: ['DE', 'GB'],
  passportValidUntil: '2029-08',
  constraints: "Eldest child; expected to help with my siblings' school fees.",
  notifications: UserNotifications(whatsapp: true, email: true, sms: false, weekly: true),
  activeGoalId: 'g1',
);

const sampleGoals = [
  Goal(
    id: 'g1',
    title: 'Head of Department',
    employer: 'Deutsche Bank',
    area: 'Corporate Bank',
    city: 'Frankfurt',
    countryId: 'DE',
    occupationId: 'isco-2413',
    field: GoalField.finance,
    targetYear: 2042,
    salaryTarget: Money(amount: 120000, currency: 'EUR', period: MoneyPeriod.year),
    priorities: ['Salary', 'Stability'],
    alternatives: ['Other EU countries', 'Stay in Africa'],
    relocate: true,
    why: 'I want to lead a team that finances businesses. My internship showed me how credit helps small firms grow.',
    pathwayIds: ['fs-master-of-finance', 'db-graduate-programme'],
    createdAt: '2026-11-01T00:00:00Z',
  ),
  Goal(
    id: 'g2',
    title: 'Data scientist',
    employer: 'a fintech',
    area: 'Credit scoring',
    city: 'Dublin',
    countryId: 'IE',
    occupationId: 'isco-2512',
    field: GoalField.tech,
    targetYear: 2036,
    salaryTarget: Money(amount: 40000, currency: 'EUR', period: MoneyPeriod.year),
    priorities: ['Impact', 'Remote work'],
    alternatives: ['Remote', 'Stay in Africa'],
    relocate: true,
    why: 'Build credit scoring that works for people without a bank history.',
    createdAt: '2026-11-02T00:00:00Z',
  ),
];

const _p = Provenance(sourceId: 'eeas-sl-consular', trust: ProvenanceTrust.editorial, fetchedAt: '2026-11-02T00:00:00Z');

/// The 10 destinations + Sierra Leone, as in seed/countries.json (names only).
const sampleCountries = [
  Country(id: 'SL', name: Localized(en: 'Sierra Leone'), region: CountryRegion.africa, currency: 'SLE', languages: ['en'], active: false, provenance: _p),
  Country(id: 'DE', name: Localized(en: 'Germany'), region: CountryRegion.europe, currency: 'EUR', languages: ['de'], active: true, provenance: _p),
  Country(id: 'GB', name: Localized(en: 'United Kingdom'), region: CountryRegion.europe, currency: 'GBP', languages: ['en'], active: true, provenance: _p),
  Country(id: 'IE', name: Localized(en: 'Ireland'), region: CountryRegion.europe, currency: 'EUR', languages: ['en'], active: true, provenance: _p),
  Country(id: 'NL', name: Localized(en: 'Netherlands'), region: CountryRegion.europe, currency: 'EUR', languages: ['nl'], active: true, provenance: _p),
  Country(id: 'FR', name: Localized(en: 'France'), region: CountryRegion.europe, currency: 'EUR', languages: ['fr'], active: true, provenance: _p),
  Country(id: 'IT', name: Localized(en: 'Italy'), region: CountryRegion.europe, currency: 'EUR', languages: ['it'], active: true, provenance: _p),
  Country(id: 'HU', name: Localized(en: 'Hungary'), region: CountryRegion.europe, currency: 'HUF', languages: ['hu'], active: true, provenance: _p),
  Country(id: 'FI', name: Localized(en: 'Finland'), region: CountryRegion.europe, currency: 'EUR', languages: ['fi'], active: true, provenance: _p),
  Country(id: 'AT', name: Localized(en: 'Austria'), region: CountryRegion.europe, currency: 'EUR', languages: ['de'], active: true, provenance: _p),
  Country(id: 'NO', name: Localized(en: 'Norway'), region: CountryRegion.europe, currency: 'NOK', languages: ['no'], active: true, provenance: _p),
];

const sampleOccupations = [
  Occupation(id: 'isco-2413', title: Localized(en: 'Financial analyst'), provenance: _p),
  Occupation(id: 'isco-2411', title: Localized(en: 'Accountant'), provenance: _p),
  Occupation(id: 'isco-3312', title: Localized(en: 'Credit and loans officer'), provenance: _p),
  Occupation(id: 'isco-4211', title: Localized(en: 'Bank teller / bank clerk'), provenance: _p),
  Occupation(id: 'isco-2512', title: Localized(en: 'Software developer'), provenance: _p),
  Occupation(id: 'isco-2221', title: Localized(en: 'Nursing professional'), provenance: _p),
];

/// Sample postings for the preview only (source "preview-sample"; the live app reads `jobs` from Adzuna etc.).
const sampleJobs = [
  Job(id: 'preview-1', title: 'Graduate Trainee, Corporate Banking', employer: 'Sample Bank AG', countryId: 'DE', city: 'Frankfurt', occupationId: 'isco-2413', level: JobLevel.entry, salary: MoneyRange(min: 48000, max: 56000, currency: 'EUR', period: MoneyPeriod.year), salaryIsEstimate: true, languageRequired: 'de', visaSponsorship: JobVisaSponsorship.unknown, url: 'https://example.com/jobs/1', source: 'preview-sample', postedAt: '2026-11-01T08:00:00Z', expireAt: '2026-12-01T08:00:00Z'),
  Job(id: 'preview-2', title: 'Junior Credit Analyst', employer: 'Sample Fintech GmbH', countryId: 'DE', city: 'Berlin', occupationId: 'isco-2413', level: JobLevel.entry, salary: MoneyRange(min: 45000, max: 52000, currency: 'EUR', period: MoneyPeriod.year), salaryIsEstimate: false, languageRequired: 'en', visaSponsorship: JobVisaSponsorship.yes, url: 'https://example.com/jobs/2', source: 'preview-sample', postedAt: '2026-10-30T08:00:00Z', expireAt: '2026-11-29T08:00:00Z'),
  Job(id: 'preview-3', title: 'Finance Intern', employer: 'Sample Asset Management', countryId: 'DE', city: 'Munich', occupationId: 'isco-2413', level: JobLevel.internship, salary: MoneyRange(min: 1800, max: 2200, currency: 'EUR', period: MoneyPeriod.month), salaryIsEstimate: true, languageRequired: 'en', visaSponsorship: JobVisaSponsorship.no, url: 'https://example.com/jobs/3', source: 'preview-sample', postedAt: '2026-10-28T08:00:00Z', expireAt: '2026-11-27T08:00:00Z'),
  Job(id: 'preview-4', title: 'Risk Manager', employer: 'Sample Bank AG', countryId: 'DE', city: 'Frankfurt', occupationId: 'isco-2413', level: JobLevel.mid, salary: MoneyRange(min: 75000, max: 90000, currency: 'EUR', period: MoneyPeriod.year), salaryIsEstimate: true, languageRequired: 'de', visaSponsorship: JobVisaSponsorship.unknown, url: 'https://example.com/jobs/4', source: 'preview-sample', postedAt: '2026-10-25T08:00:00Z', expireAt: '2026-11-24T08:00:00Z'),
  Job(id: 'preview-5', title: 'Head of SME Banking', employer: 'Sample Regional Bank', countryId: 'DE', city: 'Stuttgart', occupationId: 'isco-2413', level: JobLevel.senior, salary: MoneyRange(min: 110000, max: 140000, currency: 'EUR', period: MoneyPeriod.year), salaryIsEstimate: true, languageRequired: 'de', visaSponsorship: JobVisaSponsorship.unknown, url: 'https://example.com/jobs/5', source: 'preview-sample', postedAt: '2026-10-20T08:00:00Z', expireAt: '2026-11-19T08:00:00Z'),
  Job(id: 'preview-6', title: 'Software Developer, Payments', employer: 'Sample Fintech GmbH', countryId: 'DE', city: 'Berlin', occupationId: 'isco-2512', level: JobLevel.mid, salary: MoneyRange(min: 65000, max: 80000, currency: 'EUR', period: MoneyPeriod.year), salaryIsEstimate: false, languageRequired: 'en', visaSponsorship: JobVisaSponsorship.yes, url: 'https://example.com/jobs/6', source: 'preview-sample', postedAt: '2026-11-02T08:00:00Z', expireAt: '2026-12-02T08:00:00Z'),
];

const sampleDocuments = [
  UserDocument(id: 'd1', type: 'passport', name: 'passport.pdf', fileName: 'passport.pdf', category: UserDocumentCategory.identity, storagePath: 'preview/passport.pdf', status: UserDocumentStatus.checked, expiresAt: '2029-08-01', uploadedAt: '2026-10-03T10:00:00Z'),
  UserDocument(id: 'd2', type: 'wassce_certificate', name: 'wassce_2025.pdf', fileName: 'wassce_2025.pdf', category: UserDocumentCategory.education, storagePath: 'preview/wassce_2025.pdf', status: UserDocumentStatus.checked, uploadedAt: '2026-10-12T10:00:00Z'),
  UserDocument(id: 'd3', type: 'cv', name: 'cv_draft.docx', fileName: 'cv_draft.docx', category: UserDocumentCategory.career, storagePath: 'preview/cv_draft.docx', status: UserDocumentStatus.uploaded, uploadedAt: '2026-10-30T10:00:00Z'),
];

/// Two pending change requests as the n8n extractor would write them (preview of /admin/changes).
const sampleChangeRequests = [
  ChangeRequest(
    id: 'cr-preview-1',
    runId: 'run-preview',
    targetCollection: 'residencePermits',
    targetId: 'FI-student',
    op: ChangeRequestOp.update,
    before: {'fee': {'amount': 450, 'currency': 'EUR', 'period': 'once'}},
    after: {'fee': {'amount': 600, 'currency': 'EUR', 'period': 'once'}},
    diff: [DiffEntry(path: 'fee.amount', from: 450, to: 600)],
    sourceId: 'fi-migri-study',
    evidence: Evidence(url: 'https://migri.fi/en/residence-permit-application-for-studies', quote: 'The processing fee for an online application for a first residence permit for studies increases to EUR 600.', fetchedAt: '2026-11-03T06:00:00Z'),
    extractedBy: 'claude-sonnet-5-5',
    confidence: 0.92,
    status: ChangeRequestStatus.pending,
    createdAt: '2026-11-03T06:05:00Z',
  ),
  ChangeRequest(
    id: 'cr-preview-2',
    runId: 'run-preview',
    targetCollection: 'funding',
    targetId: 'chevening',
    op: ChangeRequestOp.update,
    before: {'applicationWindow': {'opens': '2026-08-04', 'closes': '2026-10-06'}},
    after: {'applicationWindow': {'opens': '2027-08-03', 'closes': '2027-10-05'}},
    diff: [DiffEntry(path: 'applicationWindow.opens', from: '2026-08-04', to: '2027-08-03'), DiffEntry(path: 'applicationWindow.closes', from: '2026-10-06', to: '2027-10-05')],
    sourceId: 'uk-chevening-sl',
    evidence: Evidence(url: 'https://www.chevening.org/scholarship/sierra-leone/', quote: 'Applications for 2028/2029 Chevening Scholarships open on 3 August 2027.', fetchedAt: '2026-11-03T06:00:00Z'),
    extractedBy: 'claude-sonnet-5-5',
    confidence: 0.71,
    status: ChangeRequestStatus.pending,
    createdAt: '2026-11-03T06:06:00Z',
  ),
];

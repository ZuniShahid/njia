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

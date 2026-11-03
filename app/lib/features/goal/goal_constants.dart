// Fixed lists from the prototype goal form.
import '../../core/models/models.dart';

const priorityOptions = ['Salary', 'Stability', 'Impact', 'Work-life balance', 'Remote work', 'Close to family', 'Prestige'];
const alternativeOptions = ['Other EU countries', 'Stay in Africa', 'Fintech', 'International orgs', 'Remote', 'Start my own business', 'Public sector'];

const fieldLabels = {
  GoalField.finance: 'Banking & finance',
  GoalField.tech: 'Software & data',
  GoalField.health: 'Health',
  GoalField.engineering: 'Engineering',
  GoalField.business: 'Business & entrepreneurship',
};

/// Default city per country (prototype CTRY[].city) when the student leaves City empty.
const defaultCity = {
  'DE': 'Frankfurt', 'GB': 'London', 'IE': 'Dublin', 'IT': 'Milan', 'HU': 'Budapest', 'FI': 'Helsinki',
  'AT': 'Vienna', 'NO': 'Oslo', 'FR': 'Paris', 'NL': 'Amsterdam', 'SL': 'Freetown',
};

/// "Start from an example" (prototype TEMPLATES). Occupation ids point at seed/occupations.json where one fits.
const goalTemplates = [
  Goal(title: 'Civil engineer', employer: 'an infrastructure firm', area: 'Roads & bridges', city: 'Vienna', countryId: 'AT', field: GoalField.engineering, targetYear: 2037, salaryTarget: Money(amount: 65000, currency: 'EUR', period: MoneyPeriod.year), priorities: ['Stability', 'Salary'], alternatives: ['Stay in Africa'], relocate: true, why: 'Build roads that last through the rainy season.'),
  Goal(title: 'Public health officer', employer: 'an international health agency', area: 'Epidemiology', city: 'London', countryId: 'GB', field: GoalField.health, targetYear: 2038, salaryTarget: Money(amount: 45000, currency: 'EUR', period: MoneyPeriod.year), priorities: ['Impact'], alternatives: ['International orgs', 'Stay in Africa'], relocate: true, why: 'Help prevent the next outbreak.'),
  Goal(title: 'Founder, agri-food business', employer: 'own company', area: 'Cassava processing', city: 'Freetown', countryId: 'SL', field: GoalField.business, targetYear: 2034, salaryTarget: Money(amount: 20000, currency: 'EUR', period: MoneyPeriod.year), priorities: ['Impact', 'Close to family'], alternatives: ['Start my own business'], relocate: false, why: 'Process local crops instead of importing food.'),
  Goal(title: 'Software engineer', employer: 'a mobile money company', area: 'Payments', city: 'Amsterdam', countryId: 'NL', occupationId: 'isco-2512', field: GoalField.tech, targetYear: 2035, salaryTarget: Money(amount: 30000, currency: 'EUR', period: MoneyPeriod.year), priorities: ['Remote work', 'Salary'], alternatives: ['Remote', 'Fintech'], relocate: true, why: 'Build payment tools for small traders.'),
];

const emptyGoal = Goal(countryId: 'DE', field: GoalField.finance, targetYear: 2038, salaryTarget: Money(amount: 50000, currency: 'EUR', period: MoneyPeriod.year), relocate: true);

/// Earliest realistic target year: after graduation, plus time for the move and a master's abroad.
int earliestTargetYear({required int? graduationYear, required String countryId, DateTime? now}) {
  final y = (now ?? DateTime.now()).year;
  final grad = graduationYear ?? y;
  return [y + 1, grad + (countryId == 'SL' ? 1 : 3)].reduce((a, b) => a > b ? a : b);
}

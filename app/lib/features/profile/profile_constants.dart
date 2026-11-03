// Fixed chip lists and language names from the prototype.
const interestOptions = ['Working with numbers', 'Helping people', 'Clear structure', 'Travel', 'Leading teams', 'Creative work', 'Technology', 'Research', 'Building things', 'Selling'];
const strengthOptions = ['Analytical', 'Persistent', 'Good with people', 'Fast learner', 'Organised', 'Public speaking', 'Writing', 'Hands-on', 'Calm under pressure', 'Self-starter'];

/// ISO 639 codes used in `users.languages[].lang` and in requirement keys (`language.de.cefr`).
const languageNames = {
  'en': 'English', 'kri': 'Krio', 'de': 'German', 'fr': 'French', 'it': 'Italian', 'nl': 'Dutch', 'hu': 'Hungarian',
  'fi': 'Finnish', 'no': 'Norwegian', 'es': 'Spanish', 'pt': 'Portuguese', 'ar': 'Arabic', 'tem': 'Temne', 'men': 'Mende',
  'ful': 'Fula', 'lim': 'Limba', 'sv': 'Swedish', 'da': 'Danish', 'pl': 'Polish', 'tr': 'Turkish', 'zh': 'Chinese',
};

String languageName(String? code) => code == null ? '' : (languageNames[code] ?? code);

/// "German" → "de"; unknown names are kept as typed (lower-cased) so the engine key is still stable.
String languageCode(String typed) {
  final t = typed.trim();
  for (final e in languageNames.entries) {
    if (e.value.toLowerCase() == t.toLowerCase() || e.key == t.toLowerCase()) return e.key;
  }
  return t.toLowerCase();
}

const iscedLabels = {
  '3': 'Secondary (WASSCE)', '4': 'Post-secondary certificate', '5': 'Diploma / short tertiary', '6': "Bachelor's", '7': "Master's", '8': 'Doctorate',
};

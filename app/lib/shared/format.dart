/// Short, English, no intl dependency – matches the prototype ("2 Nov 2026").
const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/// "2 Nov 2026". Accepts ISO date or date-time strings; returns the input unchanged if it does not parse.
String formatDate(String? iso) {
  if (iso == null || iso.isEmpty) return '';
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return '${d.day} ${_months[d.month - 1]} ${d.year}';
}

/// "EUR 11,904" – thousands separator, no decimals unless needed.
String formatMoney(num amount, String currency) {
  final whole = amount.truncate();
  final s = whole.abs().toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  final frac = amount - whole;
  final tail = frac == 0 ? '' : '.${(frac.abs() * 100).round().toString().padLeft(2, '0')}';
  return '$currency ${whole < 0 ? '-' : ''}$buf$tail';
}

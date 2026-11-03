/// Short, English, no intl dependency – matches the prototype ("2 Nov 2026").
const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/// "2 Nov 2026". Accepts ISO date or date-time strings; returns the input unchanged if it does not parse.
String formatDate(String? iso) {
  if (iso == null || iso.isEmpty) return '';
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return '${d.day} ${_months[d.month - 1]} ${d.year}';
}

/// ISO code → symbol where one is common; other codes stay codes ("HUF 1,200").
String currencySymbol(String code) => switch (code) { 'EUR' => '€', 'GBP' => '£', 'USD' => '\$', _ => code };

/// "€120,000" / "HUF 11,904" – thousands separator, no decimals unless needed; a space only after a code.
String formatMoney(num amount, String currency) {
  currency = currencySymbol(currency);
  final whole = amount.truncate();
  final s = whole.abs().toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  final frac = amount - whole;
  final tail = frac == 0 ? '' : '.${(frac.abs() * 100).round().toString().padLeft(2, '0')}';
  final sep = currency.length > 1 ? ' ' : '';
  return '$currency$sep${whole < 0 ? '-' : ''}$buf$tail';
}

const _weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
String weekdayName(DateTime d) => _weekdays[d.weekday - 1];
String monthShort(DateTime d) => _months[d.month - 1];

/// Fractional year → "Jun 2027" (prototype `ym`).
String formatYear(double y) {
  var yy = y.floor();
  var m = ((y - yy) * 12).round();
  if (m > 11) {
    m = 0;
    yy++;
  }
  return '${_months[m]} $yy';
}

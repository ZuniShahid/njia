// Accordion bodies of the profile screen. Each gets the profile and an `onSave(patch)` callback
// that writes a partial update to users/{uid}.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/links.dart';
import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../../shared/widgets/ui.dart';
import 'profile_constants.dart';

typedef SavePatch = Future<void> Function(Map<String, Object?> patch);

int? _int(String s) => int.tryParse(s.trim());

// ---------------------------------------------------------------- Personal details
class PersonalSection extends StatefulWidget {
  const PersonalSection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;
  @override
  State<PersonalSection> createState() => _PersonalSectionState();
}

class _PersonalSectionState extends State<PersonalSection> {
  late final _name = TextEditingController(text: widget.profile.displayName);
  late final _email = TextEditingController(text: widget.profile.email);
  late final _phone = TextEditingController(text: widget.profile.phone);
  late final _city = TextEditingController(text: widget.profile.city);

  @override
  void dispose() {
    for (final c in [_name, _email, _phone, _city]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormGrid(children: [
            Field(label: 'Full name', child: TextField(controller: _name, textCapitalization: TextCapitalization.words)),
            Field(label: 'Email', child: TextField(controller: _email, keyboardType: TextInputType.emailAddress)),
            Field(label: 'Phone (for SMS / WhatsApp)', child: TextField(controller: _phone, keyboardType: TextInputType.phone)),
            Field(label: 'City', child: TextField(controller: _city)),
          ]),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => widget.onSave({
              'displayName': _name.text.trim().isEmpty ? widget.profile.displayName : _name.text.trim(),
              'email': _email.text.trim(),
              'phone': _phone.text.trim(),
              'city': _city.text.trim(),
            }),
            child: const Text('Save details'),
          ),
        ],
      );
}

// ---------------------------------------------------------------- Education
class EducationSection extends StatefulWidget {
  const EducationSection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;
  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  final _qual = TextEditingController();
  final _where = TextEditingController();
  final _year = TextEditingController();
  String _isced = '6';
  UserEducationStatus _status = UserEducationStatus.inProgress;

  @override
  void dispose() {
    _qual.dispose();
    _where.dispose();
    _year.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _json(List<UserEducation> list) => list.map((e) => e.toJson()).toList();

  @override
  Widget build(BuildContext context) {
    final edu = widget.profile.education;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (i, e) in edu.indexed)
          ListRow(
            icon: Icons.school_outlined,
            title: e.field ?? iscedLabels[e.isced?.value] ?? 'Qualification',
            subtitle: [e.institution, e.year?.toString()].where((x) => x != null && x.isNotEmpty).join(' · '),
            trailing: [
              NjiaBadge(e.status == UserEducationStatus.completed ? 'Completed' : 'In progress', tone: e.status == UserEducationStatus.completed ? BadgeTone.ok : BadgeTone.info),
              IconButton(
                tooltip: 'Remove',
                icon: const Icon(Icons.close_rounded, size: 14),
                onPressed: () => widget.onSave({'education': _json([...edu]..removeAt(i))}),
              ),
            ],
          ),
        const SizedBox(height: 8),
        FormGrid(children: [
          Field(label: 'Qualification', child: TextField(controller: _qual, decoration: const InputDecoration(hintText: 'e.g. BSc Accounting & Finance'))),
          Field(label: 'Where', child: TextField(controller: _where, decoration: const InputDecoration(hintText: 'e.g. Fourah Bay College (USL)'))),
          SelectField<String>(
            label: 'Level',
            value: _isced,
            items: [for (final e in iscedLabels.entries) (e.key, e.value)],
            onChanged: (v) => setState(() => _isced = v ?? '6'),
          ),
          Field(label: 'Year (finished or expected)', child: TextField(controller: _year, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
          SelectField<UserEducationStatus>(
            label: 'Status',
            value: _status,
            items: const [(UserEducationStatus.inProgress, 'In progress'), (UserEducationStatus.completed, 'Completed')],
            onChanged: (v) => setState(() => _status = v ?? UserEducationStatus.inProgress),
          ),
        ]),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () async {
            if (_qual.text.trim().isEmpty) return;
            final entry = UserEducation(
              field: _qual.text.trim(),
              institution: _where.text.trim().isEmpty ? null : _where.text.trim(),
              isced: Isced.values.firstWhere((v) => v.value == _isced),
              year: _int(_year.text),
              status: _status,
            );
            await widget.onSave({'education': _json([...edu, entry])});
            _qual.clear();
            _where.clear();
            _year.clear();
          },
          icon: const Icon(Icons.add_rounded, size: 14),
          label: const Text('Add'),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Languages
const _levels = ['None', 'A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'Native'];

class LanguagesSection extends StatefulWidget {
  const LanguagesSection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;
  @override
  State<LanguagesSection> createState() => _LanguagesSectionState();
}

class _LanguagesSectionState extends State<LanguagesSection> {
  final _add = TextEditingController();
  @override
  void dispose() {
    _add.dispose();
    super.dispose();
  }

  String _levelOf(UserLanguage l) => l.native == true ? 'Native' : l.cefr?.value ?? 'None';

  UserLanguage _withLevel(UserLanguage l, String level) => switch (level) {
        'None' => UserLanguage(lang: l.lang, test: l.test, score: l.score, testDate: l.testDate),
        'Native' => UserLanguage(lang: l.lang, cefr: Cefr.c2, native: true, test: l.test, score: l.score, testDate: l.testDate),
        _ => UserLanguage(lang: l.lang, cefr: Cefr.values.firstWhere((c) => c.value == level), test: l.test, score: l.score, testDate: l.testDate),
      };

  @override
  Widget build(BuildContext context) {
    final langs = widget.profile.languages;
    List<Map<String, dynamic>> json(List<UserLanguage> l) => l.map((x) => x.toJson()).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (i, l) in langs.indexed)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(child: Text(languageName(l.lang), style: const TextStyle(fontWeight: FontWeight.w600))),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    initialValue: _levelOf(l),
                    isDense: true,
                    items: [for (final lv in _levels) DropdownMenuItem(value: lv, child: Text(lv))],
                    onChanged: (v) => widget.onSave({'languages': json([...langs]..[i] = _withLevel(l, v ?? 'None'))}),
                  ),
                ),
                IconButton(
                  tooltip: 'Remove',
                  icon: const Icon(Icons.close_rounded, size: 14),
                  onPressed: () => widget.onSave({'languages': json([...langs]..removeAt(i))}),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _add,
                decoration: const InputDecoration(hintText: 'Add a language'),
                onSubmitted: (_) => _submit(langs),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton(onPressed: () => _submit(langs), child: const Text('Add')),
          ],
        ),
      ],
    );
  }

  Future<void> _submit(List<UserLanguage> langs) async {
    final code = languageCode(_add.text);
    if (code.isEmpty || langs.any((l) => l.lang == code)) return;
    await widget.onSave({'languages': [...langs.map((x) => x.toJson()), UserLanguage(lang: code, cefr: Cefr.a1).toJson()]});
    _add.clear();
  }
}

// ---------------------------------------------------------------- Experience
class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;
  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final _role = TextEditingController();
  final _where = TextEditingController();
  final _months = TextEditingController();
  @override
  void dispose() {
    _role.dispose();
    _where.dispose();
    _months.dispose();
    super.dispose();
  }

  Map<String, Object?> _patch(List<UserExperience> list) => {
        'experience': list.map((e) => e.toJson()).toList(),
        'experienceMonths': list.fold<int>(0, (s, e) => s + (e.months ?? 0)),
      };

  @override
  Widget build(BuildContext context) {
    final exp = widget.profile.experience;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (i, e) in exp.indexed)
          ListRow(
            icon: Icons.work_outline_rounded,
            title: e.role ?? '',
            subtitle: [e.where, if (e.months != null) '${e.months} months'].where((x) => x != null && x.isNotEmpty).join(' · '),
            trailing: [
              IconButton(tooltip: 'Remove', icon: const Icon(Icons.close_rounded, size: 14), onPressed: () => widget.onSave(_patch([...exp]..removeAt(i)))),
            ],
          ),
        const SizedBox(height: 8),
        FormGrid(children: [
          Field(label: 'Role', child: TextField(controller: _role, decoration: const InputDecoration(hintText: 'e.g. Intern, credit team'))),
          Field(label: 'Where · when', child: TextField(controller: _where, decoration: const InputDecoration(hintText: 'Freetown · 2028'))),
          Field(label: 'Months (full-time equivalent)', child: TextField(controller: _months, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
        ]),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () async {
            if (_role.text.trim().isEmpty) return;
            await widget.onSave(_patch([...exp, UserExperience(role: _role.text.trim(), where: _where.text.trim().isEmpty ? null : _where.text.trim(), months: _int(_months.text))]));
            _role.clear();
            _where.clear();
            _months.clear();
          },
          icon: const Icon(Icons.add_rounded, size: 14),
          label: const Text('Add'),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Chips (interests, strengths)
class ChipSection extends StatefulWidget {
  const ChipSection({super.key, required this.options, required this.selected, required this.custom, required this.caption, required this.onChanged});
  final List<String> options;
  final List<String> selected;
  final List<String> custom;
  final String caption;
  final void Function(List<String> selected, List<String> custom) onChanged;
  @override
  State<ChipSection> createState() => _ChipSectionState();
}

class _ChipSectionState extends State<ChipSection> {
  final _add = TextEditingController();
  @override
  void dispose() {
    _add.dispose();
    super.dispose();
  }

  void _toggle(String v) {
    final sel = [...widget.selected];
    sel.contains(v) ? sel.remove(v) : sel.add(v);
    widget.onChanged(sel, widget.custom);
  }

  void _addCustom() {
    final v = _add.text.trim();
    if (v.isEmpty) return;
    final custom = [...widget.custom];
    if (!custom.contains(v) && !widget.options.contains(v)) custom.add(v);
    final sel = [...widget.selected];
    if (!sel.contains(v)) sel.add(v);
    widget.onChanged(sel, custom);
    _add.clear();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final o in [...widget.options, ...widget.custom])
                ToggleChip(
                  label: o,
                  selected: widget.selected.contains(o),
                  onTap: () => _toggle(o),
                  onRemove: widget.custom.contains(o)
                      ? () => widget.onChanged([...widget.selected]..remove(o), [...widget.custom]..remove(o))
                      : null,
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: TextField(controller: _add, maxLength: 40, decoration: const InputDecoration(hintText: 'Add your own…', counterText: ''), onSubmitted: (_) => _addCustom())),
              const SizedBox(width: 8),
              OutlinedButton.icon(onPressed: _addCustom, icon: const Icon(Icons.add_rounded, size: 14), label: const Text('Add')),
            ],
          ),
          const SizedBox(height: 8),
          Text(widget.caption, style: Theme.of(context).textTheme.bodySmall),
        ],
      );
}

// ---------------------------------------------------------------- Money
class MoneySection extends StatefulWidget {
  const MoneySection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;
  @override
  State<MoneySection> createState() => _MoneySectionState();
}

class _MoneySectionState extends State<MoneySection> {
  late final _sav = TextEditingController(text: widget.profile.savings?.amount.round().toString());
  late final _mon = TextEditingController(text: widget.profile.monthlySupport?.amount.round().toString());
  late final _sup = TextEditingController(text: widget.profile.supportSource);
  @override
  void dispose() {
    _sav.dispose();
    _mon.dispose();
    _sup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormGrid(children: [
            Field(label: 'Savings today (€)', child: TextField(controller: _sav, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
            Field(label: 'Monthly support (€)', child: TextField(controller: _mon, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
          ]),
          const SizedBox(height: 12),
          Field(label: 'Who supports you', child: TextField(controller: _sup, decoration: const InputDecoration(hintText: 'e.g. family, church, employer'))),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {
              final sav = _int(_sav.text);
              final mon = _int(_mon.text);
              widget.onSave({
                'savings': sav == null ? null : const Money(amount: 0, currency: 'EUR').copyWith(amount: sav.toDouble()).toJson(),
                'monthlySupport': mon == null ? null : Money(amount: mon.toDouble(), currency: 'EUR', period: MoneyPeriod.month).toJson(),
                'supportSource': _sup.text.trim(),
              });
            },
            child: const Text('Save money details'),
          ),
          const SizedBox(height: 8),
          Text('Feeds the funding gap and the realism score. Never shown to employers.', style: Theme.of(context).textTheme.bodySmall),
        ],
      );
}

// ---------------------------------------------------------------- Mobility & constraints
class MobilitySection extends StatefulWidget {
  const MobilitySection({super.key, required this.profile, required this.countries, required this.onSave});
  final UserProfile profile;
  final List<Country> countries;
  final SavePatch onSave;
  @override
  State<MobilitySection> createState() => _MobilitySectionState();
}

class _MobilitySectionState extends State<MobilitySection> {
  late final _move = TextEditingController(text: widget.profile.earliestMoveYear?.toString());
  late final _grad = TextEditingController(text: widget.profile.graduationYear?.toString());
  late final _pass = TextEditingController(text: widget.profile.passportValidUntil);
  late final _cons = TextEditingController(text: widget.profile.constraints);
  late final List<String> _pref = [...widget.profile.preferredCountryIds];
  String? _passError;

  @override
  void dispose() {
    for (final c in [_move, _grad, _pass, _cons]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final dest = widget.countries.where((c) => c.id != 'SL').toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormGrid(children: [
          Field(label: 'Earliest year you can move abroad', child: TextField(controller: _move, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
          Field(label: 'Expected graduation year', child: TextField(controller: _grad, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
          Field(
            label: 'Passport valid until (YYYY-MM)',
            hint: _passError,
            child: TextField(controller: _pass, decoration: const InputDecoration(hintText: '2029-08')),
          ),
          Field(
            label: 'Preferred countries',
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final c in dest)
                  ToggleChip(
                    label: c.name.en,
                    selected: _pref.contains(c.id),
                    onTap: () => setState(() => _pref.contains(c.id) ? _pref.remove(c.id) : _pref.add(c.id)),
                  ),
              ],
            ),
          ),
        ]),
        const SizedBox(height: 12),
        Field(
          label: 'Things the plan must respect',
          child: TextField(controller: _cons, maxLines: 2, decoration: const InputDecoration(hintText: 'Family duties, work, health, religion, anything the coach should know')),
        ),
        const SizedBox(height: 12),
        FilledButton(
          onPressed: () {
            final pass = _pass.text.trim();
            if (pass.isNotEmpty && !RegExp(r'^\d{4}-(0[1-9]|1[0-2])$').hasMatch(pass)) {
              setState(() => _passError = 'Use the form 2029-08.');
              return;
            }
            setState(() => _passError = null);
            widget.onSave({
              'earliestMoveYear': _int(_move.text),
              'graduationYear': _int(_grad.text),
              'passportValidUntil': pass.isEmpty ? null : pass,
              'preferredCountryIds': _pref,
              'constraints': _cons.text.trim(),
            });
          },
          child: const Text('Save'),
        ),
        const SizedBox(height: 8),
        Text('Changes the earliest realistic target year and the watch-outs on your roadmap.', style: text.bodySmall),
      ],
    );
  }
}

// ---------------------------------------------------------------- Notifications
class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key, required this.profile, required this.onSave});
  final UserProfile profile;
  final SavePatch onSave;

  @override
  Widget build(BuildContext context) {
    final n = profile.notifications ?? const UserNotifications();
    final rows = <(String, String, bool?)>[
      ('whatsapp', 'WhatsApp reminders', n.whatsapp),
      ('sms', 'SMS reminders', n.sms),
      ('email', 'Email', n.email),
      ('weekly', 'Weekly summary', n.weekly),
    ];
    return Column(
      children: [
        for (final (key, label, value) in rows)
          LabeledRow(
            label: label,
            trailing: Switch(
              value: value ?? false,
              onChanged: (v) => onSave({'notifications': {...n.toJson(), key: v}}),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Login & security
class SecuritySection extends StatefulWidget {
  const SecuritySection({super.key, required this.onChangePassword});
  final Future<void> Function(String password) onChangePassword;
  @override
  State<SecuritySection> createState() => _SecuritySectionState();
}

class _SecuritySectionState extends State<SecuritySection> {
  final _pw1 = TextEditingController();
  final _pw2 = TextEditingController();
  String? _error;
  @override
  void dispose() {
    _pw1.dispose();
    _pw2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LabeledRow(label: 'Two-step login with SMS code', trailing: Switch(value: false, onChanged: null)),
        Text('Not available yet.', style: text.bodySmall),
        const SizedBox(height: 12),
        FormGrid(children: [
          Field(label: 'New password', child: TextField(controller: _pw1, obscureText: true, autofillHints: const [AutofillHints.newPassword])),
          Field(label: 'Repeat', child: TextField(controller: _pw2, obscureText: true, autofillHints: const [AutofillHints.newPassword])),
        ]),
        if (_error != null) Padding(padding: const EdgeInsets.only(top: 8), child: Text(_error!, style: TextStyle(fontSize: 12, color: context.tokens.bad))),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () async {
            if (_pw1.text.length < 8) return setState(() => _error = 'Use at least 8 characters.');
            if (_pw1.text != _pw2.text) return setState(() => _error = "The passwords don't match");
            setState(() => _error = null);
            await widget.onChangePassword(_pw1.text);
            _pw1.clear();
            _pw2.clear();
          },
          child: const Text('Change password'),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Privacy & data
class DataSection extends StatefulWidget {
  const DataSection({super.key, required this.profile, required this.goals, required this.onDelete});
  final UserProfile profile;
  final List<Goal> goals;
  final Future<void> Function() onDelete;
  @override
  State<DataSection> createState() => _DataSectionState();
}

class _DataSectionState extends State<DataSection> {
  bool _confirm = false;

  void _export(BuildContext context) {
    final data = const JsonEncoder.withIndent('  ').convert({
      'profile': widget.profile.toJson(),
      'goals': widget.goals.map((g) => g.toJson()).toList(),
    });
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Your data'),
        content: SizedBox(width: 520, child: SingleChildScrollView(child: SelectableText(data, style: const TextStyle(fontSize: 12, fontFamily: 'monospace')))),
        actions: [
          TextButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: data));
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: const Text('Copy'),
          ),
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Close')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your goals, checklists and profile are stored in the EU and belong to you.', style: text.bodySmall),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            OutlinedButton(onPressed: () => _export(context), child: const Text('Export my data')),
            TextButton(onPressed: openPrivacyPolicy, child: const Text('Privacy policy')),
            if (_confirm) ...[
              Text('Delete everything?', style: TextStyle(fontSize: 12, color: t.bad)),
              FilledButton(style: FilledButton.styleFrom(backgroundColor: t.bad), onPressed: widget.onDelete, child: const Text('Yes, delete')),
              TextButton(onPressed: () => setState(() => _confirm = false), child: const Text('Cancel')),
            ] else
              OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: t.bad),
                onPressed: () => setState(() => _confirm = true),
                child: const Text('Delete account'),
              ),
          ],
        ),
      ],
    );
  }
}

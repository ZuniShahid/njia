// Prototype `goalForm()`: one form for "Add a goal" and "Edit goal". Pure UI – the caller saves.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../../shared/widgets/ui.dart';
import 'goal_constants.dart';

class GoalForm extends ConsumerStatefulWidget {
  const GoalForm({super.key, required this.initial, required this.isNew, required this.onSubmit, this.onCancel});
  final Goal initial;
  final bool isNew;
  final Future<void> Function(Goal goal) onSubmit;
  final VoidCallback? onCancel;

  @override
  ConsumerState<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends ConsumerState<GoalForm> {
  late Goal _g = widget.initial;
  late final _role = TextEditingController(text: _g.title);
  late final _emp = TextEditingController(text: _g.employer);
  late final _area = TextEditingController(text: _g.area);
  late final _city = TextEditingController(text: _g.city);
  late final _year = TextEditingController(text: _g.targetYear?.toString());
  late final _sal = TextEditingController(text: _g.salaryTarget?.amount.round().toString());
  late final _why = TextEditingController(text: _g.why);
  String? _error;
  bool _busy = false;

  @override
  void dispose() {
    for (final c in [_role, _emp, _area, _city, _year, _sal, _why]) {
      c.dispose();
    }
    super.dispose();
  }

  void _applyTemplate(Goal t) {
    setState(() {
      _g = t.copyWith(id: _g.id, createdAt: _g.createdAt);
      _role.text = t.title ?? '';
      _emp.text = t.employer ?? '';
      _area.text = t.area ?? '';
      _city.text = t.city ?? '';
      _year.text = t.targetYear?.toString() ?? '';
      _sal.text = t.salaryTarget?.amount.round().toString() ?? '';
      _why.text = t.why ?? '';
    });
  }

  Future<void> _useStarter(StarterGoal st) async {
    final year = [DateTime.now().year + st.yearsAhead, _minYear].reduce((a, b) => a > b ? a : b);
    _applyTemplate(st.goal.copyWith(targetYear: year));
    await _submit();
  }

  int get _minYear => earliestTargetYear(graduationYear: ref.read(profileProvider).value?.graduationYear, countryId: _g.countryId ?? 'DE');

  Goal _read() {
    final countryId = _g.countryId ?? 'DE';
    final sal = int.tryParse(_sal.text.trim());
    return _g.copyWith(
      title: _role.text.trim(),
      employer: _emp.text.trim(),
      area: _area.text.trim(),
      countryId: countryId,
      city: _city.text.trim().isEmpty ? defaultCity[countryId] : _city.text.trim(),
      targetYear: int.tryParse(_year.text.trim()),
      salaryTarget: sal == null ? null : Money(amount: sal.toDouble(), currency: 'EUR', period: MoneyPeriod.year),
      why: _why.text.trim(),
    );
  }

  Future<void> _submit() async {
    final g = _read();
    final minY = _minYear;
    if ((g.title ?? '').isEmpty) return setState(() => _error = 'Add your dream job.');
    if (g.targetYear == null || g.targetYear! < minY) {
      return setState(() => _error = 'Pick $minY or later. The roadmap needs time for the degree${g.countryId == 'SL' ? '' : ', the move and a master'}.');
    }
    setState(() {
      _error = null;
      _busy = true;
    });
    try {
      await widget.onSubmit(g);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final t = context.tokens;
    final countries = ref.watch(countriesProvider).value ?? const <Country>[];
    final occupations = ref.watch(occupationsProvider).value ?? const <Occupation>[];
    final countryItems = <(String, String)>[
      for (final c in countries) (c.id, c.name.en),
      if (!countries.any((c) => c.id == 'SL')) ('SL', 'Sierra Leone'),
    ];
    if (_g.countryId != null && !countryItems.any((c) => c.$1 == _g.countryId)) countryItems.add((_g.countryId!, _g.countryId!));
    final firstGoal = (ref.watch(goalsProvider).value ?? const <Goal>[]).isEmpty;
    final occItems = <(String?, String)>[(null, 'Not sure yet'), for (final o in occupations) (o.id, o.title.en)];
    if (_g.occupationId != null && !occItems.any((o) => o.$1 == _g.occupationId)) occItems.add((_g.occupationId, _g.occupationId!));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.isNew && firstGoal) ...[
          const OverLabel('Pick a starting point'),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, c) {
              final cards = [for (final st in starterGoals) _StarterCard(starter: st, busy: _busy, onUse: () => _useStarter(st))];
              if (c.maxWidth < 620) return Column(children: [for (final w in cards) Padding(padding: const EdgeInsets.only(bottom: 10), child: w)]);
              return IntrinsicHeight(
                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  for (final (i, w) in cards.indexed) ...[if (i > 0) const SizedBox(width: 10), Expanded(child: w)],
                ]),
              );
            },
          ),
          const SizedBox(height: 6),
          Text('Or describe your own goal below.', style: text.bodySmall),
          const SizedBox(height: 14),
        ] else if (widget.isNew) ...[
          const OverLabel('Start from an example'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final tpl in goalTemplates) ToggleChip(label: '${tpl.title} · ${tpl.city}', selected: false, onTap: () => _applyTemplate(tpl))],
          ),
          const SizedBox(height: 14),
        ],
        Field(label: 'Dream job', child: TextField(controller: _role, decoration: const InputDecoration(hintText: 'e.g. Data scientist'), textCapitalization: TextCapitalization.sentences)),
        const SizedBox(height: 14),
        FormGrid(children: [
          Field(label: 'Employer or type', child: TextField(controller: _emp, decoration: const InputDecoration(hintText: 'e.g. a fintech'))),
          Field(label: 'Area', child: TextField(controller: _area, decoration: const InputDecoration(hintText: 'e.g. Credit scoring'))),
        ]),
        const SizedBox(height: 14),
        FormGrid(children: [
          SelectField<String>(
            label: 'Country',
            value: _g.countryId,
            items: countryItems,
            onChanged: (v) => setState(() => _g = _g.copyWith(countryId: v)),
          ),
          Field(label: 'City', child: TextField(controller: _city, decoration: InputDecoration(hintText: defaultCity[_g.countryId] ?? ''))),
        ]),
        const SizedBox(height: 14),
        FormGrid(children: [
          SelectField<GoalField>(
            label: 'Field',
            value: _g.field ?? GoalField.finance,
            items: [for (final e in fieldLabels.entries) (e.key, e.value)],
            onChanged: (v) => setState(() => _g = _g.copyWith(field: v)),
          ),
          Field(
            label: 'Target year',
            hint: 'Earliest realistic: $_minYear',
            child: TextField(controller: _year, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
          ),
        ]),
        const SizedBox(height: 14),
        SelectField<String?>(
          label: 'Occupation (matches programmes and jobs)',
          value: _g.occupationId,
          items: occItems,
          onChanged: (v) => setState(() => _g = _g.copyWith(occupationId: v)),
        ),
        const SizedBox(height: 14),
        Field(label: 'Salary target (€ per year)', child: TextField(controller: _sal, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
        const SizedBox(height: 14),
        Field(
          label: 'What matters most',
          child: Wrap(spacing: 6, runSpacing: 6, children: [
            for (final o in priorityOptions)
              ToggleChip(label: o, selected: _g.priorities.contains(o), onTap: () => setState(() => _g = _g.copyWith(priorities: _toggle(_g.priorities, o)))),
          ]),
        ),
        const SizedBox(height: 14),
        Field(
          label: 'Open to alternatives',
          child: Wrap(spacing: 6, runSpacing: 6, children: [
            for (final o in alternativeOptions)
              ToggleChip(label: o, selected: _g.alternatives.contains(o), onTap: () => setState(() => _g = _g.copyWith(alternatives: _toggle(_g.alternatives, o)))),
          ]),
        ),
        const SizedBox(height: 14),
        LabeledRow(label: 'Willing to move abroad', trailing: Switch(value: _g.relocate ?? true, onChanged: (v) => setState(() => _g = _g.copyWith(relocate: v)))),
        const SizedBox(height: 14),
        Field(label: 'Why this goal', child: TextField(controller: _why, maxLines: 3)),
        if (_error != null) ...[
          const SizedBox(height: 10),
          Text(_error!, key: const Key('goal-error'), style: TextStyle(fontSize: 12, color: t.bad)),
        ],
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(child: FilledButton(onPressed: _busy ? null : _submit, child: Text(widget.isNew ? 'Add goal and open it' : 'Save changes'))),
            if (widget.onCancel != null) ...[
              const SizedBox(width: 10),
              OutlinedButton(onPressed: widget.onCancel, child: const Text('Cancel')),
            ],
          ],
        ),
        if (widget.isNew) Padding(padding: const EdgeInsets.only(top: 8), child: Text('Your roadmap is computed on the server as soon as the goal is saved.', style: text.bodySmall)),
      ],
    );
  }

  static List<String> _toggle(List<String> list, String v) => list.contains(v) ? ([...list]..remove(v)) : [...list, v];
}

class _StarterCard extends StatelessWidget {
  const _StarterCard({required this.starter, required this.busy, required this.onUse});
  final StarterGoal starter;
  final bool busy;
  final VoidCallback onUse;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final g = starter.goal;
    final place = g.city ?? defaultCity[g.countryId] ?? '';
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: t.surface, border: Border.all(color: t.line), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OverLabel(starter.route, color: t.brand),
          const SizedBox(height: 6),
          Text(g.title ?? '', style: text.titleMedium),
          Text([place, g.employer].where((x) => x != null && x.isNotEmpty).join(' · '), style: text.bodySmall),
          const SizedBox(height: 8),
          Text(starter.pitch, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: busy ? null : onUse, child: const Text('Start with this'))),
        ],
      ),
    );
  }
}

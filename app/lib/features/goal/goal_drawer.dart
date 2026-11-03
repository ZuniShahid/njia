// Prototype goal drawer (`drawer()`): right-hand panel with the goal list, "Add a goal",
// "What you told us", "About you", and the add/edit form.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../../shared/format.dart';
import '../../shared/widgets/ui.dart';
import '../profile/profile_constants.dart';
import 'goal_constants.dart';
import 'goal_form.dart';
import 'goal_title.dart';

enum GoalDrawerMode { list, create, edit }

Future<void> showGoalDrawer(BuildContext context, {GoalDrawerMode mode = GoalDrawerMode.list}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: context.tokens.scrim,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, _, _) => Align(alignment: Alignment.centerRight, child: GoalDrawer(initialMode: mode)),
    transitionBuilder: (ctx, anim, _, child) => SlideTransition(
      position: Tween(begin: const Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
      child: child,
    ),
  );
}

class GoalDrawer extends ConsumerStatefulWidget {
  const GoalDrawer({super.key, this.initialMode = GoalDrawerMode.list});
  final GoalDrawerMode initialMode;

  @override
  ConsumerState<GoalDrawer> createState() => _GoalDrawerState();
}

class _GoalDrawerState extends ConsumerState<GoalDrawer> {
  late GoalDrawerMode _mode = widget.initialMode;
  String? _confirmDelete;
  final _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _save(Goal g, {required bool isNew}) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    final repo = ref.read(userRepositoryProvider);
    final id = await repo.saveGoal(uid, g);
    if (isNew) await repo.updateProfile(uid, {'activeGoalId': id});
    if (!mounted) return;
    toast(context, isNew ? 'Goal added. The cockpit now follows: ${goalTitle(g)}' : 'Goal updated');
    Navigator.of(context).pop();
    if (isNew) context.go(Routes.cockpit);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    final title = switch (_mode) { GoalDrawerMode.list => 'Your goals', GoalDrawerMode.create => 'Add a goal', GoalDrawerMode.edit => 'Edit goal' };
    return Material(
      color: t.surface,
      elevation: 0,
      child: SafeArea(
        child: SizedBox(
          width: width < 500 ? width : 500,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))),
                child: Row(
                  children: [
                    Expanded(child: Text(title, style: text.titleLarge)),
                    IconButton(tooltip: 'Close', onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close_rounded)),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                  children: [
                    switch (_mode) {
                      GoalDrawerMode.list => _list(context),
                      GoalDrawerMode.create => GoalForm(
                          initial: emptyGoal,
                          isNew: true,
                          onSubmit: (g) => _save(g, isNew: true),
                          onCancel: () => setState(() => _mode = GoalDrawerMode.list),
                        ),
                      GoalDrawerMode.edit => GoalForm(
                          initial: ref.read(activeGoalProvider) ?? emptyGoal,
                          isNew: false,
                          onSubmit: (g) => _save(g, isNew: false),
                          onCancel: () => setState(() => _mode = GoalDrawerMode.list),
                        ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final goals = ref.watch(goalsProvider).value ?? const <Goal>[];
    final active = ref.watch(activeGoalProvider);
    final p = ref.watch(profileProvider).value;
    final countries = ref.watch(countriesProvider).value ?? const <Country>[];
    String countryName(String? id) => countries.where((c) => c.id == id).firstOrNull?.name.en ?? (id == 'SL' ? 'Sierra Leone' : id ?? '');
    final uid = ref.read(currentUidProvider);
    final g = active;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Up to $maxGoals goals. Switching changes the whole cockpit.', style: text.bodySmall),
        const SizedBox(height: 10),
        for (final (i, x) in goals.indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: x.id == g?.id ? t.brandSoft : t.surface,
                border: Border.all(color: x.id == g?.id ? t.brand : t.line),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: uid == null ? null : () => ref.read(userRepositoryProvider).updateProfile(uid, {'activeGoalId': x.id}),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: x.id == g?.id ? t.brand : t.subtle, shape: BoxShape.circle),
                            child: Text('${i + 1}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: x.id == g?.id ? t.onBrand : t.ink)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(goalTitle(x), style: const TextStyle(fontWeight: FontWeight.w700)),
                                Text('${goalLocation(x, countryName(x.countryId))} · ${x.targetYear ?? ''}', style: text.bodySmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (x.id == g?.id) const Padding(padding: EdgeInsets.only(left: 8), child: NjiaBadge('Active', tone: BadgeTone.brand)),
                  if (goals.length > 1)
                    if (_confirmDelete == x.id) ...[
                      const SizedBox(width: 8),
                      FilledButton(
                        style: FilledButton.styleFrom(backgroundColor: t.bad, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6)),
                        onPressed: () async {
                          if (uid != null) await ref.read(userRepositoryProvider).deleteGoal(uid, x.id!);
                          setState(() => _confirmDelete = null);
                        },
                        child: const Text('Delete'),
                      ),
                      TextButton(onPressed: () => setState(() => _confirmDelete = null), child: const Text('Keep')),
                    ] else
                      IconButton(tooltip: 'Delete goal', icon: const Icon(Icons.close_rounded, size: 14), onPressed: () => setState(() => _confirmDelete = x.id)),
                ],
              ),
            ),
          ),
        FilledButton.icon(
          onPressed: goals.length >= maxGoals ? null : () => setState(() => _mode = GoalDrawerMode.create),
          icon: const Icon(Icons.add_rounded, size: 14),
          label: Text(goals.length >= maxGoals ? 'Add a goal ($maxGoals of $maxGoals used)' : 'Add a goal'),
        ),
        if (g != null) ...[
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: Text('What you told us', style: text.titleMedium)),
              OutlinedButton.icon(onPressed: () => setState(() => _mode = GoalDrawerMode.edit), icon: const Icon(Icons.edit_outlined, size: 14), label: const Text('Edit goal')),
            ],
          ),
          const SizedBox(height: 10),
          KeyValueList([
            ('Dream job', g.title ?? ''),
            ('Employer', g.employer ?? ''),
            ('Area', g.area ?? ''),
            ('Location', goalLocation(g, countryName(g.countryId))),
            ('Field', fieldLabels[g.field] ?? ''),
            ('Target year', g.targetYear?.toString() ?? ''),
            ('Salary target', g.salaryTarget == null ? '' : '${formatMoney(g.salaryTarget!.amount, '€')} / year'),
            ('What matters', g.priorities.join(', ')),
            ('Alternatives', g.alternatives.join(', ')),
            ('Move abroad', g.relocate == false ? 'No' : 'Yes'),
            ('Why', g.why ?? ''),
          ]),
        ],
        if (p != null) ...[
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: Text('About you', style: text.titleMedium)),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.go(Routes.profile);
                },
                child: const Text('Edit in profile'),
              ),
            ],
          ),
          Text('Used for every goal', style: text.bodySmall),
          const SizedBox(height: 10),
          KeyValueList([
            ('Education', p.education.map((e) => e.field ?? '').where((x) => x.isNotEmpty).join(' · ')),
            ('Languages', p.languages.where((l) => l.cefr != null || l.native == true).map((l) => '${languageName(l.lang)} ${l.native == true ? 'Native' : l.cefr!.value}').join(' · ')),
            ('Experience', p.experience.map((e) => e.role ?? '').where((x) => x.isNotEmpty).join(' · ')),
            ('Interests', p.interests.join(', ')),
          ]),
        ],
      ],
    );
  }
}

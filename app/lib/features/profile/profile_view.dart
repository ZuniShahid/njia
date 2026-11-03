// Prototype `profile()`: header, identity card, accordion sections, right panel with completeness
// and the goal list. Every section saves itself (partial update of users/{uid}).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../../data/auth_service.dart';
import '../../shared/format.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../goal/goal_drawer.dart';
import '../goal/goal_title.dart';
import 'profile_constants.dart';
import 'profile_sections.dart';

/// The 14 completeness fields of the prototype (two-step login replaced by graduation year).
int profileCompleteness(UserProfile p) => [
      (p.displayName ?? '').isNotEmpty,
      (p.email ?? '').isNotEmpty,
      (p.phone ?? '').isNotEmpty,
      (p.city ?? '').isNotEmpty,
      p.education.isNotEmpty,
      p.languages.isNotEmpty,
      p.experience.isNotEmpty,
      p.interests.length >= 3,
      p.strengths.length >= 2,
      p.savings != null,
      p.earliestMoveYear != null,
      p.preferredCountryIds.isNotEmpty,
      (p.passportValidUntil ?? '').isNotEmpty,
      p.graduationYear != null,
    ].where((x) => x).length;

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  final _open = <String>{'personal'};

  Future<void> _save(Map<String, Object?> patch, {String? message}) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    await ref.read(userRepositoryProvider).updateProfile(uid, patch);
    if (mounted && message != null) toast(context, message);
  }

  Future<void> _signOut() async {
    await ref.read(authServiceProvider).signOut();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider).value;
    final goals = ref.watch(goalsProvider).value ?? const [];
    final activeId = ref.watch(activeGoalProvider)?.id;
    if (profile == null) return const Center(child: CircularProgressIndicator());
    final p = profile;
    final text = Theme.of(context).textTheme;
    final t = context.tokens;
    final name = p.displayName ?? '';
    final complete = profileCompleteness(p);
    final pct = (complete / 14 * 100).round();

    Widget acc(String key, String title, String subtitle, Widget body) => AccordionItem(
          title: title,
          subtitle: subtitle,
          open: _open.contains(key),
          onToggle: () => setState(() => _open.contains(key) ? _open.remove(key) : _open.add(key)),
          body: body,
        );

    final langSummary = p.languages.map((l) => '${languageName(l.lang)} ${l.native == true ? 'Native' : l.cefr?.value ?? 'None'}').join(' · ');
    final moneySummary = [
      if (p.savings != null) '${formatMoney(p.savings!.amount, '€')} saved' else 'not set',
      if (p.monthlySupport != null) '${formatMoney(p.monthlySupport!.amount, '€')}/month support',
    ].join(' · ');
    final countries = ref.watch(countriesProvider).value ?? const <Country>[];
    String countryName(String id) => countries.where((c) => c.id == id).firstOrNull?.name.en ?? id;
    final mobSummary = [
      if (p.earliestMoveYear != null) 'Can move from ${p.earliestMoveYear}',
      if (p.preferredCountryIds.isNotEmpty) 'prefers ${p.preferredCountryIds.map(countryName).join(', ')}',
    ].join(' · ');

    return ViewScaffold(
      center: [
        PageHead(
          over: 'Account',
          title: 'Profile',
          caption: 'Used for every goal. Change it any time.',
          actions: [OutlinedButton.icon(onPressed: _signOut, icon: const Icon(Icons.logout_rounded, size: 14), label: const Text('Sign out'))],
        ),
        NjiaCard(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                Avatar(name.isEmpty ? '?' : name, size: 56),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name.isEmpty ? 'Your name' : name, style: text.titleLarge),
                    Text(
                      [p.email, p.phone, [p.city, 'Sierra Leone'].where((x) => x != null && x.isNotEmpty).join(', ')].where((x) => x != null && x.isNotEmpty).join(' · '),
                      style: text.bodySmall,
                    ),
                  ],
                ),
                const NjiaBadge('Free plan'),
              ],
            ),
          ],
        ),
        Section(
          children: [
            acc('personal', 'Personal details', 'Name, contact, location', PersonalSection(profile: p, onSave: (patch) => _save(patch, message: 'Details saved'))),
            acc('edu', 'Education', '${p.education.length} entries', EducationSection(profile: p, onSave: _save)),
            acc('langs', 'Languages', langSummary.isEmpty ? 'Add the languages you speak' : langSummary, LanguagesSection(profile: p, onSave: _save)),
            acc('exp', 'Experience', '${p.experience.length} entries', ExperienceSection(profile: p, onSave: _save)),
            acc(
              'int',
              'Interests & values',
              '${p.interests.length} selected',
              ChipSection(
                options: interestOptions,
                selected: p.interests,
                custom: p.customInterests,
                caption: 'Used to suggest alternative goals and jobs.',
                onChanged: (selected, custom) => _save({'interests': selected, 'customInterests': custom}),
              ),
            ),
            acc(
              'str',
              'Strengths & skills',
              '${p.strengths.length} selected',
              ChipSection(
                options: strengthOptions,
                selected: p.strengths,
                custom: p.customStrengths,
                caption: "Shown to mentors and used in the coach's advice.",
                onChanged: (selected, custom) => _save({'strengths': selected, 'customStrengths': custom}),
              ),
            ),
            acc('fin', 'Money', moneySummary, MoneySection(profile: p, onSave: (patch) => _save(patch, message: 'Money details saved'))),
            acc('mob', 'Mobility & constraints', mobSummary.isEmpty ? 'When and where you can move' : mobSummary,
                MobilitySection(profile: p, countries: countries, onSave: (patch) => _save(patch, message: 'Saved'))),
            acc('notif', 'Notifications', 'How Njia reminds you', NotificationsSection(profile: p, onSave: _save)),
            acc('sec', 'Login & security', 'Password, two-step login', SecuritySection(onChangePassword: _changePassword)),
            acc('data', 'Privacy & data', 'Export or delete', DataSection(profile: p, goals: goals, onDelete: _deleteAccount)),
          ],
        ),
      ],
      right: [
        Section(
          children: [
            Text('Profile $pct% complete', style: text.titleMedium),
            ProgressBar(complete / 14, height: 8),
            if (pct < 100) Text('Fill the open sections to reach 100%.', style: text.bodySmall),
          ],
        ),
        Section(
          children: [
            Text('Your goals', style: text.titleMedium),
            Text('${goals.length} of $maxGoals', style: text.bodySmall),
            for (final (i, g) in goals.indexed)
              Row(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: g.id == activeId ? t.brand : t.subtle, shape: BoxShape.circle),
                    child: Text('${i + 1}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: g.id == activeId ? t.onBrand : t.ink)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(goalTitle(g), style: const TextStyle(fontWeight: FontWeight.w600))),
                ],
              ),
            OutlinedButton.icon(
              onPressed: () => showGoalDrawer(context),
              icon: const Icon(Icons.chevron_right_rounded, size: 16),
              label: const Text('Manage goals'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _changePassword(String password) async {
    try {
      await ref.read(authServiceProvider).changePassword(password);
      if (mounted) toast(context, 'Password changed');
    } on AuthFailure catch (e) {
      if (mounted) toast(context, e.message);
    }
  }

  Future<void> _deleteAccount() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    try {
      await ref.read(userRepositoryProvider).deleteAllUserData(uid);
      await ref.read(authServiceProvider).deleteAccount();
      if (mounted) context.go(Routes.auth);
    } on AuthFailure catch (e) {
      if (mounted) toast(context, e.message);
    }
  }
}

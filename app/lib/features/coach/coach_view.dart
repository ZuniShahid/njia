// Prototype `coach()`: Path coach (topic = whole plan / phase / step / pool, context chips,
// suggested questions, chat) and Study coach (modes, chat, draft box with "Check paragraph").
// Answers come from the `coach` Cloud Function only (10 questions a day); if it is not deployed the
// chat says so. The study coach never writes text: the paragraph check is a local heuristic.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';
import '../../core/models/models.dart';
import '../../data/coach_service.dart';
import '../../shared/format.dart';
import '../../shared/widgets/tabs.dart';
import '../../shared/widgets/ui.dart';
import '../../shared/widgets/view_scaffold.dart';
import '../big_picture/big_picture_view.dart' show pools;

enum CoachTab { path, study }

const studyModes = ['Structure', 'Feedback', 'Quiz me', 'Explain back', 'Exam plan'];

/// Prototype `checkDraft`: length, sentence openings, a concrete number, stock phrases.
List<(bool ok, String text)> checkDraft(String t) {
  final words = t.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  final sentences = t.split(RegExp(r'[.!?]+')).map((x) => x.trim()).where((x) => x.isNotEmpty).toList();
  final out = <(bool, String)>[];
  out.add(words.length < 60 ? (false, '${words.length} words. A strong opening paragraph has 60–120.') : words.length > 140 ? (false, '${words.length} words. Cut to under 120.') : (true, '${words.length} words. Good length.'));
  final iStarts = sentences.where((s) => RegExp(r'^I\b').hasMatch(s)).length;
  out.add(iStarts > 1 ? (false, '$iStarts of ${sentences.length} sentences start with "I". Vary the openings.') : (true, 'Sentence openings vary.'));
  out.add(RegExp(r'\d').hasMatch(t) ? (true, 'You use a concrete number.') : (false, 'No number or concrete result yet.'));
  out.add(RegExp(r'always loved|passion|since I was a child', caseSensitive: false).hasMatch(t) ? (false, "'Always loved' is a stock phrase. Replace it with a specific moment.") : (true, 'No stock phrases found.'));
  return out;
}

class CoachView extends ConsumerStatefulWidget {
  const CoachView({super.key, this.stepKey, this.poolId});
  final String? stepKey;
  final String? poolId;

  @override
  ConsumerState<CoachView> createState() => _CoachViewState();
}

class _CoachViewState extends ConsumerState<CoachView> {
  CoachTab _tab = CoachTab.path;
  int? _phase;
  String? _step;
  String? _pool;
  final _pathMsgs = <CoachMessage>[];
  final _studyMsgs = <CoachMessage>[];
  String _mode = studyModes.first;
  final _input = TextEditingController();
  final _studyInput = TextEditingController();
  late final _draft = TextEditingController();
  List<(bool, String)>? _feedback;
  bool _busy = false;
  bool _init = false;

  @override
  void dispose() {
    _input.dispose();
    _studyInput.dispose();
    _draft.dispose();
    super.dispose();
  }

  Future<void> _ask(List<CoachMessage> history, String question, Map<String, Object?> context, {required TextEditingController input}) async {
    final goalId = ref.read(activeGoalProvider)?.id;
    if (question.trim().isEmpty || goalId == null) return;
    setState(() {
      history.add(CoachMessage(fromCoach: false, text: question.trim()));
      _busy = true;
    });
    input.clear();
    String reply;
    try {
      if (RegExp(r'write (it|the|my)|write .*(letter|essay)|do it for me', caseSensitive: false).hasMatch(question)) {
        reply = "I won't write it for you, but I'll help you get there. Tell me one real moment and we'll turn it into your opening sentence.";
      } else {
        reply = await ref.read(coachServiceProvider).ask(goalId: goalId, context: context, history: List.of(history), question: question.trim());
      }
    } on CoachLimitReached {
      reply = "You've used today's 10 questions. Ask again tomorrow.";
    } on CoachUnavailable {
      reply = 'The coach is busy. Try again in a moment.';
    } on CoachNotConnected {
      reply = 'The coach is not connected yet. Open the step on the roadmap for what it needs and its source, or ask a mentor under Next milestone.';
    } catch (e) {
      reply = 'Something went wrong. Try again in a moment.';
    }
    if (mounted) {
      setState(() {
        history.add(CoachMessage(fromCoach: true, text: reply));
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(activeGoalProvider);
    final rm = ref.watch(roadmapProvider).value;
    if (!_init && rm != null) {
      _init = true;
      if (widget.stepKey != null) {
        final s = rm.steps.where((x) => x.key == widget.stepKey).firstOrNull;
        if (s != null) {
          _phase = s.phaseIndex;
          _step = s.key;
        }
      }
      _pool = widget.poolId;
    }
    if (goal == null) {
      return const ViewScaffold(center: [PageHead(over: 'Support', title: 'Coach', caption: 'Add a goal first; the coach talks about your plan.')]);
    }
    final tabs = NjiaTabs<CoachTab>(tabs: const [(CoachTab.path, 'Path coach'), (CoachTab.study, 'Study coach')], value: _tab, onChanged: (v) => setState(() => _tab = v));
    return _tab == CoachTab.path ? _path(context, rm, tabs) : _study(context, rm, tabs);
  }

  // ---- Path coach --------------------------------------------------------------------------------
  Widget _path(BuildContext context, RoadmapModel? rm, Widget tabs) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final phase = rm?.phases.where((p) => p.index == _phase).firstOrNull;
    final step = rm?.steps.where((s) => s.key == _step).firstOrNull;
    final pool = pools.where((p) => p.id == _pool).firstOrNull;
    final topic = pool != null ? pool.name : step != null ? 'Step ${step.number} · ${step.title}' : phase != null ? phase.name : 'Whole plan';
    final suggestions = <String>[
      if (step != null) ...['What do I need for ${step.title}?', 'How can I pay for step ${step.number}?', 'What if step ${step.number} takes longer?']
      else if (phase != null) ...['What is the first thing to do in ${phase.shortName}?', 'How long does ${phase.shortName} usually take?', 'What can go wrong in ${phase.shortName}?']
      else if (pool != null) ...[pool.question, 'What should I do first for ${pool.name.toLowerCase()}?', 'What are the risks around ${pool.name.toLowerCase()}?']
      else ...['Is my target year realistic?', 'Which step is the biggest risk?', 'What should I do this month?'],
    ];
    final ctx = <String, Object?>{'about': topic, if (phase != null) 'phase': phase.name, if (step != null) 'stepKey': step.key, if (pool != null) 'pool': pool.id};

    return ViewScaffold(
      center: [
        const PageHead(over: 'Support', title: 'Coach', caption: 'Path coach answers questions about every part of your plan. Study coach guides your writing without writing for you.'),
        NjiaCard(
          children: [
            tabs,
            const OverLabel('Advice on'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ToggleChip(label: 'Whole plan', selected: _phase == null && _pool == null, onTap: () => setState(() {
                      _phase = null;
                      _step = null;
                      _pool = null;
                    })),
                if (pool != null) ToggleChip(label: '${pool.name} ✕', selected: true, onTap: () => setState(() => _pool = null)),
                for (final p in rm?.phases ?? const <RoadmapPhase>[])
                  ToggleChip(label: p.name, selected: _phase == p.index, onTap: () => setState(() {
                        _phase = p.index;
                        _step = null;
                        _pool = null;
                      })),
              ],
            ),
            if (phase != null)
              SizedBox(
                width: 360,
                child: SelectField<String?>(
                  label: 'Step in this phase',
                  value: _step,
                  items: [(null, 'All steps in ${phase.shortName}'), for (final s in phase.steps) (s.key, '${s.number} · ${s.title}')],
                  onChanged: (v) => setState(() => _step = v),
                ),
              ),
            Row(children: [
              Expanded(child: RichText(text: TextSpan(style: text.bodySmall, children: [const TextSpan(text: 'Topic: '), TextSpan(text: topic, style: const TextStyle(fontWeight: FontWeight.w700))]))),
              if (_pathMsgs.isNotEmpty) TextButton(onPressed: () => setState(_pathMsgs.clear), child: const Text('Clear chat')),
            ]),
            _Chat(messages: _pathMsgs, empty: 'Pick a phase or step, then ask. Suggestions change with the topic.'),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final s in suggestions)
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: _busy ? null : () => _ask(_pathMsgs, s, ctx, input: _input),
                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: t.brandSoft, borderRadius: BorderRadius.circular(12)), child: Text(s, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.brand))),
                ),
            ]),
            Row(children: [
              Expanded(child: TextField(controller: _input, decoration: InputDecoration(hintText: 'Ask about $topic…'), onSubmitted: (v) => _ask(_pathMsgs, v, ctx, input: _input))),
              const SizedBox(width: 8),
              FilledButton(onPressed: _busy ? null : () => _ask(_pathMsgs, _input.text, ctx, input: _input), child: const Text('Send')),
            ]),
            Row(children: [Icon(Icons.shield_outlined, size: 14, color: t.muted), const SizedBox(width: 6), Expanded(child: Text('Answers come from the server and will cite the source of every number. The coach never applies or writes for you.', style: text.bodySmall))]),
          ],
        ),
      ],
      right: [
        NjiaCard(
          padding: const EdgeInsets.all(16),
          gap: 6,
          children: [
            const OverLabel('Topic'),
            Text(topic, style: const TextStyle(fontWeight: FontWeight.w700)),
            Text(
              phase != null ? '${formatYear(phase.start)} – ${formatYear(phase.end)}' : '${rm?.stepsTotal ?? 0} steps · ${rm?.phases.length ?? 0} phases · target ${rm?.goal.targetYear ?? ''}',
              style: text.bodySmall,
            ),
          ],
        ),
        Section(
          children: [
            Text('Open it in the plan', style: text.titleMedium),
            if (step != null)
              OutlinedButton.icon(onPressed: () => context.go('${Routes.roadmap}?step=${Uri.encodeComponent(step.key)}'), icon: const Icon(Icons.view_timeline_outlined, size: 14), label: Text('Step ${step.number} on the roadmap'))
            else if (phase != null)
              OutlinedButton.icon(onPressed: () => context.go(Routes.roadmap), icon: const Icon(Icons.view_timeline_outlined, size: 14), label: Text('${phase.shortName} on the roadmap'))
            else
              OutlinedButton.icon(onPressed: () => context.go(Routes.map), icon: const Icon(Icons.public_rounded, size: 14), label: const Text('Big picture')),
            if (phase?.isMove == true) OutlinedButton.icon(onPressed: () => context.go(Routes.visa), icon: const Icon(Icons.badge_outlined, size: 14), label: const Text('Visa & residence')),
            OutlinedButton.icon(onPressed: () => context.go(Routes.milestone), icon: const Icon(Icons.flag_outlined, size: 14), label: const Text('Next milestone')),
          ],
        ),
        Section(
          children: [
            Text('Other help', style: text.titleMedium),
            const ListRow(icon: Icons.people_outline_rounded, title: 'Find a tutor', subtitle: 'Language and test preparation'),
            const ListRow(icon: Icons.person_outline_rounded, title: 'Ask a mentor', subtitle: 'Someone who did this route'),
            const ListRow(icon: Icons.info_outline_rounded, title: 'Read the guide', subtitle: 'Country pages and checklists'),
            Text('Helpers are verified before they appear. Students never pay for job placement.', style: text.bodySmall),
          ],
        ),
      ],
    );
  }

  // ---- Study coach -------------------------------------------------------------------------------
  Widget _study(BuildContext context, RoadmapModel? rm, Widget tabs) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final apply = rm?.steps.where((s) => s.kind == PlanStepKind.apply).firstOrNull;
    final words = _draft.text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
    final own = _draft.text.split(RegExp(r'[.!?]+')).where((s) => s.trim().isNotEmpty).length;
    final hints = _studyMsgs.where((m) => m.fromCoach).length + (_feedback?.length ?? 0);
    final ctx = <String, Object?>{'about': 'Study coach · $_mode', 'mode': _mode};

    return ViewScaffold(
      center: [
        const PageHead(over: 'Support', title: 'Coach', caption: "Study coach guides your writing. It doesn't write for you."),
        NjiaCard(
          children: [
            tabs,
            Wrap(spacing: 8, runSpacing: 8, children: [for (final m in studyModes) ToggleChip(label: m, selected: _mode == m, onTap: () => setState(() => _mode = m))]),
            _Chat(messages: _studyMsgs, empty: 'Pick a mode and write your answer. The coach asks questions and comments; it never writes your text.'),
            Row(children: [
              Expanded(child: TextField(controller: _studyInput, decoration: const InputDecoration(hintText: 'Write your answer…'), onSubmitted: (v) => _ask(_studyMsgs, v, ctx, input: _studyInput))),
              const SizedBox(width: 8),
              FilledButton(onPressed: _busy ? null : () => _ask(_studyMsgs, _studyInput.text, ctx, input: _studyInput), child: const Text('Send')),
            ]),
            Row(children: [Icon(Icons.shield_outlined, size: 14, color: t.muted), const SizedBox(width: 6), Expanded(child: Text("The coach won't write your letters or answers for you.", style: text.bodySmall))]),
          ],
        ),
        NjiaCard(
          gap: 10,
          children: [
            Text('Your draft · paragraph 1', style: text.titleMedium),
            Text('Write here, then check it', style: text.bodySmall),
            TextField(controller: _draft, maxLines: 5, onChanged: (_) => setState(() {}), decoration: const InputDecoration(hintText: 'Your opening paragraph…')),
            Wrap(spacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
              FilledButton(onPressed: _draft.text.trim().isEmpty ? null : () => setState(() => _feedback = checkDraft(_draft.text)), child: const Text('Check paragraph')),
              Text('$words words', style: text.bodySmall),
            ]),
            if (_feedback != null)
              Column(children: [for (final (ok, msg) in _feedback!) Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [StatusMark(ok ? 2 : 1), const SizedBox(width: 10), Expanded(child: Text(msg, style: const TextStyle(fontSize: 12)))]))]),
          ],
        ),
      ],
      right: [
        NjiaCard(
          padding: const EdgeInsets.all(16),
          gap: 4,
          children: [
            const OverLabel('Task'),
            Text('Motivation letter${apply == null ? '' : ' · ${apply.title.replaceFirst('Apply: ', '')}'}', style: const TextStyle(fontWeight: FontWeight.w700)),
            Text(apply == null ? 'No application step on your route yet.' : 'Due ${formatYear(apply.end)} · roadmap step ${apply.number}', style: text.bodySmall),
          ],
        ),
        Section(
          children: [
            Text('Transparency log', style: text.titleMedium),
            KeyValueRow('Sentences you wrote', '$own'),
            KeyValueRow('Hints from the coach', '$hints'),
            const KeyValueRow('Text written by the coach', '0'),
            Text('You can share this log with your lecturer.', style: text.bodySmall),
          ],
        ),
        Section(
          children: [
            Text('Recent sessions', style: text.titleMedium),
            Text('No saved sessions yet. Sessions are kept on this device only.', style: text.bodySmall),
          ],
        ),
      ],
    );
  }
}

class _Chat extends StatelessWidget {
  const _Chat({required this.messages, required this.empty});
  final List<CoachMessage> messages;
  final String empty;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    if (messages.isEmpty) return Text(empty, style: text.bodySmall);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 420),
      child: ListView(
        shrinkWrap: true,
        reverse: true,
        children: [
          for (final m in messages.reversed)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: m.fromCoach ? MainAxisAlignment.start : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (m.fromCoach) ...[
                    Container(width: 28, height: 28, decoration: BoxDecoration(color: t.brand, shape: BoxShape.circle), child: Icon(Icons.auto_awesome_rounded, size: 14, color: t.onBrand)),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: m.fromCoach ? t.surface : t.brand,
                          border: Border.all(color: m.fromCoach ? t.line : Colors.transparent),
                          borderRadius: m.fromCoach ? const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)) : const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(4), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                        ),
                        child: Text(m.text, style: TextStyle(color: m.fromCoach ? t.ink : t.onBrand)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

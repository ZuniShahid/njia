// "Ask Njia" assistant (prototype `renderBot`): a floating button that appears 2 s after the student
// scrolls a view, a one-question peek the first time per view, and a chat panel that stays on the
// current page. Answers come from the `coach` Cloud Function with the current view or step as
// context – the same backend and guard rails as the Coach page.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../app/theme.dart';
import '../../data/coach_service.dart';

const _viewLabels = {
  Routes.cockpit: 'Cockpit',
  Routes.milestone: 'Next milestone',
  Routes.map: 'Big picture',
  Routes.roadmap: 'Roadmap',
  Routes.readiness: 'Readiness',
  Routes.finances: 'Finances',
  Routes.visa: 'Visa & residence',
  Routes.jobs: 'Jobs',
  Routes.documents: 'Documents',
  Routes.profile: 'Profile',
};

const _viewPrompts = {
  Routes.cockpit: ['What should I do this week?', 'Is my target year realistic?', 'What is my biggest risk?'],
  Routes.milestone: ['Where do I start?', 'What can I do without money?', 'Who can help me with this?'],
  Routes.map: ['Where should I start?', 'What depends on what?', 'What is my weakest area?'],
  Routes.roadmap: ['Can I get there faster?', 'Which step is the hardest?', 'What happens after my studies?'],
  Routes.readiness: ['Which requirement matters most?', 'How do I reach the language level?', 'How is my score calculated?'],
  Routes.finances: ['How can I close the funding gap?', 'Which scholarships fit me?', 'What is a blocked account?'],
  Routes.visa: ['What do I need for the visa?', 'Where do I apply from Sierra Leone?', 'How long does it take?'],
  Routes.jobs: ['Which jobs fit my goal?', 'Do employers sponsor visas?', 'What salary can I expect?'],
  Routes.documents: ['Which documents do I need first?', 'Do my certificates need translation?', 'How do I get my transcript?'],
  Routes.profile: ['Which details improve my plan?', 'Why do you ask about my savings?', 'Is my data safe?'],
};

const _stepPrompts = ['What does this step need?', 'How long does it take?', 'What can go wrong here?'];
const _poolPrompts = ['Where do I start here?', 'What does this depend on?', 'What does it cost?'];

/// Same rule as the Coach page: the coach guides, it never writes the student's texts.
bool asksForGhostwriting(String q) => RegExp(r'write (it|the|my)|write .*(letter|essay)|do it for me', caseSensitive: false).hasMatch(q);
const noGhostwriting = "I won't write it for you, but I'll help you get there. Tell me one real moment and we'll turn it into your opening sentence.";

class AssistantState {
  const AssistantState({
    this.route = Routes.cockpit,
    this.fab = false,
    this.peek = false,
    this.open = false,
    this.busy = false,
    this.seen = const {},
    this.messages = const [],
    this.about,
    this.context = const {},
    this.asked = const {},
  });
  final String route;
  final bool fab, peek, open, busy;
  final Set<String> seen;
  final List<CoachMessage> messages;

  /// What the chat is about when a step or pool was picked; null = the current view.
  final String? about;
  final Map<String, Object?> context;
  final Set<String> asked;

  String get aboutLabel => about ?? _viewLabels[route] ?? 'Your plan';

  List<String> get suggestions {
    final pool = context.containsKey('stepKey') ? _stepPrompts : context.containsKey('pool') ? _poolPrompts : (_viewPrompts[route] ?? _viewPrompts[Routes.cockpit]!);
    return [...pool.where((q) => !asked.contains(q)), ...pool.where(asked.contains)].take(3).toList();
  }

  AssistantState copyWith({String? route, bool? fab, bool? peek, bool? open, bool? busy, Set<String>? seen, List<CoachMessage>? messages, String? about, bool clearAbout = false, Map<String, Object?>? context, Set<String>? asked}) =>
      AssistantState(
        route: route ?? this.route,
        fab: fab ?? this.fab,
        peek: peek ?? this.peek,
        open: open ?? this.open,
        busy: busy ?? this.busy,
        seen: seen ?? this.seen,
        messages: messages ?? this.messages,
        about: clearAbout ? null : (about ?? this.about),
        context: context ?? this.context,
        asked: asked ?? this.asked,
      );
}

class AssistantController extends Notifier<AssistantState> {
  Timer? _timer;

  static const delay = Duration(seconds: 2);

  @override
  AssistantState build() {
    ref.onDispose(() => _timer?.cancel());
    return const AssistantState();
  }

  /// Route changed: forget the step context, drop the peek (prototype `hashchange`).
  void setRoute(String route, {required bool narrow}) {
    if (route == state.route) return;
    _timer?.cancel();
    _timer = null;
    state = state.copyWith(route: route, peek: false, open: narrow ? false : state.open, clearAbout: true, context: const {});
  }

  /// The student scrolled the current view past the top: after 2 s show the button, and the peek
  /// once per view.
  void scrolled() {
    final s = state;
    if (s.open || _timer != null || (s.fab && s.seen.contains(s.route))) return;
    final route = s.route;
    _timer = Timer(delay, () {
      _timer = null;
      final now = state;
      if (now.route != route || now.open) return;
      final firstTime = !now.seen.contains(route);
      state = now.copyWith(fab: true, peek: firstTime || now.peek, seen: {...now.seen, route});
    });
  }

  void openChat() => state = state.copyWith(open: true, peek: false, fab: true);
  void close() => state = state.copyWith(open: false, fab: true);
  void dismissPeek() => state = state.copyWith(peek: false, fab: true);

  /// Opens the chat on this page about one step or pool (roadmap, milestone, big picture).
  void openAbout(String about, Map<String, Object?> context) =>
      state = state.copyWith(open: true, peek: false, fab: true, about: about, context: context);

  Future<void> ask(String question) async {
    final q = question.trim();
    if (q.isEmpty || state.busy) return;
    final history = [...state.messages, CoachMessage(fromCoach: false, text: q)];
    state = state.copyWith(messages: history, busy: true, open: true, peek: false, fab: true, asked: {...state.asked, q});
    String reply;
    final goalId = ref.read(activeGoalProvider)?.id;
    if (goalId == null) {
      reply = 'Add a goal first. Then I can answer about your plan.';
    } else if (asksForGhostwriting(q)) {
      reply = noGhostwriting;
    } else {
      try {
        reply = await ref.read(coachServiceProvider).ask(goalId: goalId, context: {'about': state.aboutLabel, ...state.context}, history: history, question: q);
      } on CoachLimitReached {
        reply = "You've used today's 10 questions. Ask again tomorrow.";
      } on CoachUnavailable {
        reply = 'The coach is busy. Try again in a moment.';
      } on CoachNotConnected {
        reply = 'The coach is not connected yet. Open the step on the roadmap for what it needs and its source.';
      } catch (_) {
        reply = 'Something went wrong. Try again in a moment.';
      }
    }
    state = state.copyWith(messages: [...state.messages, CoachMessage(fromCoach: true, text: reply)], busy: false);
  }
}

final assistantProvider = NotifierProvider<AssistantController, AssistantState>(AssistantController.new);

/// Watches vertical scrolling in [child] and draws the assistant over it, bottom right.
class AssistantLayer extends ConsumerStatefulWidget {
  const AssistantLayer({super.key, required this.location, required this.narrow, required this.child});
  final String location;
  final bool narrow;
  final Widget child;

  @override
  ConsumerState<AssistantLayer> createState() => _AssistantLayerState();
}

class _AssistantLayerState extends ConsumerState<AssistantLayer> {
  String get _route => widget.location.split('?').first;
  bool get _hidden => _route == Routes.coach || _route.startsWith('/goal') || _route.startsWith('/admin');

  @override
  void didUpdateWidget(covariant AssistantLayer old) {
    super.didUpdateWidget(old);
    if (old.location.split('?').first != _route) {
      Future.microtask(() => ref.read(assistantProvider.notifier).setRoute(_route, narrow: widget.narrow));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(assistantProvider.notifier).setRoute(_route, narrow: widget.narrow));
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(assistantProvider);
    final gap = widget.narrow ? 16.0 : 24.0;
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (n) {
        if (!_hidden && n.metrics.axis == Axis.vertical && n.metrics.pixels > 40) ref.read(assistantProvider.notifier).scrolled();
        return false;
      },
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          if (!_hidden && (s.open || s.peek))
            Positioned(
              right: gap,
              bottom: gap + 68,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: (MediaQuery.sizeOf(context).width - 2 * gap).clamp(240.0, 390.0).toDouble()),
                child: s.open ? const _Panel() : const _Peek(),
              ),
            ),
          if (!_hidden && (s.fab || s.open))
            Positioned(
              right: gap,
              bottom: gap,
              child: FloatingActionButton(
                key: const Key('assistant-fab'),
                heroTag: 'assistant-fab',
                tooltip: s.open ? 'Close assistant' : 'Open assistant',
                backgroundColor: context.tokens.brand,
                foregroundColor: context.tokens.onBrand,
                shape: const CircleBorder(),
                onPressed: () => s.open ? ref.read(assistantProvider.notifier).close() : ref.read(assistantProvider.notifier).openChat(),
                child: Icon(s.open ? Icons.close_rounded : Icons.chat_bubble_outline_rounded),
              ),
            ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(width: 26, height: 26, decoration: BoxDecoration(color: t.brand, shape: BoxShape.circle), child: Icon(Icons.auto_awesome_rounded, size: 13, color: t.onBrand));
  }
}

BoxDecoration _cardDecoration(BuildContext context) {
  final t = context.tokens;
  return BoxDecoration(
    color: t.surface,
    border: Border.all(color: t.line),
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 24, offset: Offset(0, 8))],
  );
}

class _SuggestionChip extends ConsumerWidget {
  const _SuggestionChip(this.question);
  final String question;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => ref.read(assistantProvider.notifier).ask(question),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(color: t.brandSoft, borderRadius: BorderRadius.circular(999)),
        child: Text(question, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: t.brand)),
      ),
    );
  }
}

class _Peek extends ConsumerWidget {
  const _Peek();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(assistantProvider);
    final n = ref.read(assistantProvider.notifier);
    return Material(
      color: Colors.transparent,
      child: Container(
        key: const Key('assistant-peek'),
        padding: const EdgeInsets.all(14),
        decoration: _cardDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const _Avatar(),
              const SizedBox(width: 8),
              const Expanded(child: Text('Ask Njia', style: TextStyle(fontWeight: FontWeight.w700))),
              IconButton(tooltip: 'Dismiss', visualDensity: VisualDensity.compact, icon: const Icon(Icons.close_rounded, size: 16), onPressed: n.dismissPeek),
            ]),
            const SizedBox(height: 8),
            if (s.suggestions.isNotEmpty) _SuggestionChip(s.suggestions.first),
            const SizedBox(height: 6),
            TextButton(onPressed: n.openChat, child: const Text('Open chat →')),
          ],
        ),
      ),
    );
  }
}

class _Panel extends ConsumerStatefulWidget {
  const _Panel();
  @override
  ConsumerState<_Panel> createState() => _PanelState();
}

class _PanelState extends ConsumerState<_Panel> {
  final _input = TextEditingController();

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void _send() {
    final q = _input.text;
    _input.clear();
    ref.read(assistantProvider.notifier).ask(q);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(assistantProvider);
    final n = ref.read(assistantProvider.notifier);
    final t = context.tokens;
    final text = Theme.of(context).textTheme;
    final maxH = (MediaQuery.sizeOf(context).height * 0.6).clamp(300.0, 520.0).toDouble();
    return Material(
      color: Colors.transparent,
      child: Container(
        key: const Key('assistant-panel'),
        constraints: BoxConstraints(maxHeight: maxH),
        decoration: _cardDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 6, 8),
              child: Row(children: [
                const _Avatar(),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Ask Njia', style: TextStyle(fontWeight: FontWeight.w700)),
                    Text('About: ${s.aboutLabel}', maxLines: 1, overflow: TextOverflow.ellipsis, style: text.bodySmall),
                  ]),
                ),
                IconButton(tooltip: 'Minimise', icon: const Icon(Icons.expand_more_rounded, size: 18), onPressed: n.close),
              ]),
            ),
            Divider(height: 1, color: t.line),
            Flexible(
              child: s.messages.isEmpty
                  ? Padding(padding: const EdgeInsets.all(14), child: Text('Ask about what you are looking at. Every number comes with its source.', style: text.bodySmall))
                  : ListView(
                      reverse: true,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12),
                      children: [
                        if (s.busy)
                          const Padding(padding: EdgeInsets.only(bottom: 10), child: Row(children: [_Avatar(), SizedBox(width: 8), SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))])),
                        for (final m in s.messages.reversed)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: m.fromCoach ? MainAxisAlignment.start : MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (m.fromCoach) ...[const _Avatar(), const SizedBox(width: 8)],
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                                    decoration: BoxDecoration(color: m.fromCoach ? t.subtle : t.brand, borderRadius: BorderRadius.circular(12)),
                                    child: SelectableText(m.text, style: TextStyle(fontSize: 13, height: 1.4, color: m.fromCoach ? t.ink : t.onBrand)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: Wrap(spacing: 6, runSpacing: 6, children: [for (final q in s.suggestions) _SuggestionChip(q)]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    key: const Key('assistant-input'),
                    controller: _input,
                    decoration: const InputDecoration(hintText: 'Ask anything…', isDense: true),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(tooltip: 'Send', onPressed: s.busy ? null : _send, icon: const Icon(Icons.send_rounded, size: 18)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

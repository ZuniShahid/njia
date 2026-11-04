// Year axis, phase tracks and step bars shared by the cockpit mini-Gantt and the roadmap.
import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/engine/roadmap_model.dart';

/// Phase colour p1…p6 (cycles beyond 6).
Color phaseColor(BuildContext context, int index) => context.tokens.phases[(index - 1) % 6];
Color phaseSoft(BuildContext context, int index) => context.tokens.phasesSoft[(index - 1) % 6];

/// `.axis`: year labels positioned by fraction.
class YearAxis extends StatelessWidget {
  const YearAxis({super.key, required this.model});
  final RoadmapModel model;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: 16,
    child: LayoutBuilder(
      builder: (context, c) => Stack(
        clipBehavior: Clip.none,
        children: [
          for (final y in model.ticks)
            Positioned(
              left: model.px(y.toDouble()) * c.maxWidth - 14,
              child: Text('$y', style: TextStyle(fontSize: 11, color: context.tokens.muted)),
            ),
        ],
      ),
    ),
  );
}

/// A track with faint year grid lines, optional today marker and one or more bars.
class Track extends StatelessWidget {
  const Track({
    super.key,
    required this.model,
    required this.height,
    required this.bars,
    this.showToday = false,
    this.todayLabel = false,
  });
  final RoadmapModel model;
  final double height;
  final List<Widget Function(double width)> bars;
  final bool showToday;
  final bool todayLabel;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, c) => Stack(
          clipBehavior: Clip.none,
          children: [
            for (final y in model.ticks)
              Positioned(
                left: model.px(y.toDouble()) * c.maxWidth,
                top: 0,
                bottom: 0,
                child: Container(width: 1, color: t.line),
              ),
            for (final b in bars) b(c.maxWidth),
            if (showToday)
              Positioned(
                left: model.px(model.todayYear) * c.maxWidth - 1,
                top: -4,
                bottom: -4,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(width: 2, color: t.bad),
                    if (todayLabel)
                      Positioned(
                        top: -2,
                        left: -16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(color: t.bad, borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            'Today',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Prototype `miniGantt`: label column + axis + one track per phase.
class MiniGantt extends StatelessWidget {
  const MiniGantt({super.key, required this.model});
  final RoadmapModel model;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return LayoutBuilder(
      builder: (context, c) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 520, maxWidth: c.maxWidth < 520 ? 520 : c.maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const SizedBox(width: 110),
                  Expanded(child: YearAxis(model: model)),
                ],
              ),
              const SizedBox(height: 6),
              for (final (i, p) in model.phases.indexed)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(color: phaseColor(context, p.index), shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                p.shortName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: t.ink),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Track(
                          model: model,
                          height: 20,
                          showToday: i == 0,
                          bars: [
                            (w) => Positioned(
                              left: model.px(p.start) * w,
                              width: ((model.px(p.end) - model.px(p.start)) * w).clamp(4, w),
                              top: 4,
                              height: 12,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: phaseColor(context, p.index),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

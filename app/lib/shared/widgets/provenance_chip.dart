import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/models/models.dart';
import '../format.dart';

/// Rule 2 in CLAUDE.md: every content number shown in the UI carries provenance.
/// - `trust: estimate` → amber "Estimate · to verify"
/// - verified by a human → "Checked 2 Nov 2026 · source"
/// - otherwise → "Fetched 2 Nov 2026 · source" (neutral)
class ProvenanceChip extends StatelessWidget {
  const ProvenanceChip(this.provenance, {super.key, this.sourceName, this.onTap});

  final Provenance provenance;

  /// Human-readable source name (sources/{id}.name); falls back to the source id.
  final String? sourceName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final source = sourceName ?? provenance.sourceId;
    final isEstimate = provenance.trust == ProvenanceTrust.estimate;
    final verified = provenance.verifiedAt;
    final String label;
    final Color fg, bg;
    final IconData icon;
    if (isEstimate) {
      label = 'Estimate · to verify';
      fg = t.warn;
      bg = t.warnSoft;
      icon = Icons.warning_amber_rounded;
    } else if (verified != null && verified.isNotEmpty) {
      label = 'Checked ${formatDate(verified)} · $source';
      fg = t.ok;
      bg = t.okSoft;
      icon = Icons.check_rounded;
    } else {
      label = 'Fetched ${formatDate(provenance.fetchedAt)} · $source';
      fg = t.muted;
      bg = t.subtle;
      icon = Icons.schedule_rounded;
    }
    final chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(NjiaTokens.radiusChip)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: fg),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg),
            ),
          ),
        ],
      ),
    );
    final url = provenance.sourceUrl;
    return Semantics(
      label: isEstimate ? 'Estimate, not yet verified' : 'Source: $label',
      child: onTap == null && url == null
          ? chip
          : InkWell(borderRadius: BorderRadius.circular(NjiaTokens.radiusChip), onTap: onTap, child: chip),
    );
  }
}

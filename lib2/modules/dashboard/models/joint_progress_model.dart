/// A row in the dashboard's "Joint Inspection Progress" table.
class JointProgress {
  final String qrId;
  final String jobId;

  /// Completion fraction, 0.0–1.0.
  final double progress;

  /// Status label, e.g. "Insp 2 OK" / "Insp 2 REQ".
  final String statusLabel;

  /// `true` when the status is a pass (green), `false` when action is required
  /// (red).
  final bool isOk;

  const JointProgress({
    required this.qrId,
    required this.jobId,
    required this.progress,
    required this.statusLabel,
    required this.isOk,
  });

  int get progressPercent => (progress * 100).round();
}

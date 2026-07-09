/// A row in the dashboard's "Latest Submissions" table.
class Submission {
  final String qrId;
  final String jobId;
  final String projectName;
  final String time;
  final String drawingNo;

  const Submission({
    required this.qrId,
    required this.jobId,
    required this.projectName,
    required this.time,
    required this.drawingNo,
  });
}

import 'package:get/get.dart';

import '../../../utils/snackbar_utils.dart';
import '../models/joint_progress_model.dart';
import '../models/submission_model.dart';

/// Backs the Dashboard tab. Serves mock summary stats + table data; swap the
/// hard-coded lists for a repository fetch when a backend lands.
class DashboardController extends GetxController {
  final int scheduledToday = 12;

  final int inspectionsToday = 14;
  final String inspectionsTrend = '20%';

  final int pendingUploads = 4;
  final int activeJoints = 28;

  final List<JointProgress> jointProgress = const [
    JointProgress(
      qrId: 'A-102',
      jobId: 'North Wing Bracing',
      progress: 0.66,
      statusLabel: 'Insp 2 OK',
      isOk: true,
    ),
    JointProgress(
      qrId: 'B-442',
      jobId: 'Lower Foundation Tap',
      progress: 0.33,
      statusLabel: 'Insp 2 REQ',
      isOk: false,
    ),
  ];

  final List<Submission> submissions = const [
    Submission(
      qrId: 'X-901',
      jobId: 'JOB-2024-001',
      projectName: 'Proj-01',
      time: '10:42 AM',
      drawingNo: 'DWG-S4-002',
    ),
    Submission(
      qrId: 'L-110',
      jobId: 'JOB-2024-001',
      projectName: 'Proj-01',
      time: '09:15 AM',
      drawingNo: 'DWG-S4-002',
    ),
    Submission(
      qrId: 'M-004',
      jobId: 'JOB-2024-001',
      projectName: 'Proj-01',
      time: '4:55 PM',
      drawingNo: 'DWG-S4-002',
    ),
  ];

  void exportLog() => SnackbarUtils.info('Preparing export…');

  void viewAllActive() => SnackbarUtils.info('Opening all active joints…');

  void openJoint(JointProgress joint) =>
      SnackbarUtils.info('Opening ${joint.qrId} — ${joint.jobId}');

  void onMenuTap() => SnackbarUtils.info('Dashboard options');
}

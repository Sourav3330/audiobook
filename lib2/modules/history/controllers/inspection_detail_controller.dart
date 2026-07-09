import 'package:get/get.dart';

import '../../../constants/app_strings.dart';
import '../models/inspection_record_model.dart';

/// Holds the data for the Inspection Details screen: the record passed via
/// `Get.arguments` and the joint/inspection breakdown to render.
///
/// Keeping this out of the view means the widget file only describes UI. When a
/// real backend lands, swap [_buildJoints] for a repository fetch (and add a
/// loading/error state) without touching the layout.
class InspectionDetailController extends GetxController {
  late final InspectionRecord record;
  late final List<InspectionJoint> joints;

  @override
  void onInit() {
    super.onInit();
    // The History list passes the tapped record as the route argument. Fall
    // back to a placeholder if the screen is opened directly.
    record = Get.arguments is InspectionRecord
        ? Get.arguments as InspectionRecord
        : const InspectionRecord(assetId: 'SAP-001249', date: '', time: '');
    joints = _buildJoints();
  }

  /// Same demo photo used for every inspection cell.
  static const String _demoImageUrl =
      'https://powdermetallurgy.com/wp-content/uploads/2024/12/Main-Bearing-Cap-in-Engine.jpg';

  /// Mock data: 5 joints, each with 3 inspection entries. Every entry carries
  /// the same demo image URL.
  List<InspectionJoint> _buildJoints() {
    InspectionJoint joint(int n) => InspectionJoint(
          name: AppStrings.joint(n),
          entries: [
            for (var k = 1; k <= 3; k++)
              InspectionEntry(
                title: AppStrings.inspection(k),
                lines: const [
                  'Weld ID: WELD-001',
                  'Result: Pass',
                  'Depth: 12 mm',
                  'Inspector: J. Doe',
                ],
                imageUrl: _demoImageUrl,
              ),
          ],
        );
    return [for (var j = 1; j <= 5; j++) joint(j)];
  }
}

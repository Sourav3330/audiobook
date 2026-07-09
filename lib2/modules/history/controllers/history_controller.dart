import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../models/inspection_record_model.dart';

/// Backs the History tab — holds the (mock) inspection log, the search query,
/// and simple client-side pagination.
class HistoryController extends GetxController {
  static const int pageSize = 5;

  final List<InspectionRecord> _all = const [
    InspectionRecord(assetId: 'SAP-001249', date: 'Oct 24, 2023', time: '09:45 AM'),
    InspectionRecord(assetId: 'PV-44102', date: 'Oct 22, 2023', time: '02:15 PM'),
    InspectionRecord(assetId: 'GRID-901', date: 'Oct 20, 2023', time: '11:00 AM'),
    InspectionRecord(assetId: 'RAIL-N1', date: 'Oct 19, 2023', time: '08:30 AM'),
    InspectionRecord(assetId: 'EXIT-LGT', date: 'Oct 18, 2023', time: '04:50 PM'),
    InspectionRecord(assetId: 'HVAC-220', date: 'Oct 17, 2023', time: '01:10 PM'),
    InspectionRecord(assetId: 'PUMP-07', date: 'Oct 16, 2023', time: '03:25 PM'),
    InspectionRecord(assetId: 'BEAM-44', date: 'Oct 15, 2023', time: '10:05 AM'),
    InspectionRecord(assetId: 'WELD-X2', date: 'Oct 14, 2023', time: '09:00 AM'),
    InspectionRecord(assetId: 'TANK-19', date: 'Oct 13, 2023', time: '02:40 PM'),
    InspectionRecord(assetId: 'DUCT-3B', date: 'Oct 12, 2023', time: '11:55 AM'),
    InspectionRecord(assetId: 'CABLE-7', date: 'Oct 11, 2023', time: '08:15 AM'),
    InspectionRecord(assetId: 'VALVE-9', date: 'Oct 10, 2023', time: '05:20 PM'),
  ];

  final RxString query = ''.obs;
  final RxInt page = 1.obs; // 1-based

  List<InspectionRecord> get _filtered {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all.where((r) => r.assetId.toLowerCase().contains(q)).toList();
  }

  int get totalEntries => _filtered.length;

  int get pageCount => (totalEntries / pageSize).ceil().clamp(1, 9999);

  /// 1-based index of the first row shown on the current page.
  int get rangeStart => totalEntries == 0 ? 0 : (page.value - 1) * pageSize + 1;

  /// 1-based index of the last row shown on the current page.
  int get rangeEnd =>
      ((page.value) * pageSize).clamp(0, totalEntries);

  List<InspectionRecord> get pageRecords {
    final start = (page.value - 1) * pageSize;
    if (start >= totalEntries) return const [];
    final end = (start + pageSize).clamp(0, totalEntries);
    return _filtered.sublist(start, end);
  }

  void onSearch(String value) {
    query.value = value;
    page.value = 1;
  }

  void goToPage(int p) {
    if (p < 1 || p > pageCount) return;
    page.value = p;
  }

  void nextPage() => goToPage(page.value + 1);
  void prevPage() => goToPage(page.value - 1);

  void openDetail(InspectionRecord record) {
    Get.toNamed<void>(AppRoutes.inspectionDetail, arguments: record);
  }
}

/// A completed-inspection row in the History list.
class InspectionRecord {
  final String assetId;
  final String date;
  final String time;

  const InspectionRecord({
    required this.assetId,
    required this.date,
    required this.time,
  });
}

/// One inspection cell within a joint on the detail screen.
class InspectionEntry {
  final String title;
  final List<String> lines;

  /// Photo shown in the cell (network URL).
  final String imageUrl;

  const InspectionEntry({
    required this.title,
    required this.lines,
    required this.imageUrl,
  });
}

/// A joint group on the inspection-detail screen, holding its inspection cells.
class InspectionJoint {
  final String name;
  final List<InspectionEntry> entries;

  const InspectionJoint({required this.name, required this.entries});
}

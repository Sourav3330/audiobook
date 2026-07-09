import 'package:flutter/material.dart';

import '../app/theme/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// Column descriptor for [AppTable].
class TableColumnSpec {
  final String label;

  /// Flex weight relative to the other columns.
  final int flex;

  /// Horizontal alignment applied to both the header and the body cells.
  final Alignment alignment;

  const TableColumnSpec(
    this.label, {
    this.flex = 1,
    this.alignment = Alignment.centerLeft,
  });
}

/// Lightweight responsive table. Columns are laid out with flex weights so the
/// table always fits its container — no horizontal overflow on narrow tablets.
/// Each row supplies one cell widget per column.
class AppTable extends StatelessWidget {
  final List<TableColumnSpec> columns;
  final List<List<Widget>> rows;

  final EdgeInsets headerPadding;
  final EdgeInsets rowPadding;
  final bool showHeader;

  const AppTable({
    super.key,
    required this.columns,
    required this.rows,
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.md,
    ),
    this.rowPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.md,
    ),
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showHeader) _header(),
        for (var i = 0; i < rows.length; i++)
          _row(rows[i], isLast: i == rows.length - 1),
      ],
    );
  }

  Widget _header() {
    return Container(
      color: AppColors.tableHeaderBg,
      padding: headerPadding,
      child: Row(
        children: [
          for (final col in columns)
            Expanded(
              flex: col.flex,
              child: Align(
                alignment: col.alignment,
                child: Text(
                  col.label.toUpperCase(),
                  style: AppTextStyles.tableHeader,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _row(List<Widget> cells, {required bool isLast}) {
    return Container(
      padding: rowPadding,
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < columns.length; i++)
            Expanded(
              flex: columns[i].flex,
              child: Align(
                alignment: columns[i].alignment,
                child: i < cells.length ? cells[i] : const SizedBox.shrink(),
              ),
            ),
        ],
      ),
    );
  }
}

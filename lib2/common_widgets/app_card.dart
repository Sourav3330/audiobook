import 'package:flutter/material.dart';

import '../app/theme/app_decorations.dart';
import '../constants/app_sizes.dart';

/// Visual variant of [AppCard].
///
/// - [elevated]: white background, hairline border + soft shadow. Main cards.
/// - [outline]: white background + border, no shadow.
/// - [subtle]: warmer fill + border. Nested / secondary panels.
enum AppCardVariant { elevated, outline, subtle }

/// Container wrapping the project's standard decorations + a padding inset.
/// Saves every view from repeating `Container(decoration: …, padding: …)`.
class AppCard extends StatelessWidget {
  final Widget child;
  final AppCardVariant variant;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double radius;

  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.onTap,
    this.radius = AppSizes.radius12,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = switch (variant) {
      AppCardVariant.subtle => AppDecorations.subtleCard(radius: radius),
      AppCardVariant.outline => AppDecorations.outlineCard(radius: radius),
      AppCardVariant.elevated => AppDecorations.card(radius: radius),
    };

    final inner = Container(
      decoration: decoration,
      padding: padding,
      child: child,
    );
    if (onTap == null) return inner;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: inner,
    );
  }
}

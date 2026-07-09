import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

/// Breakpoint tiers for the Inspector app. The mocks target tablets, so the
/// layout is tuned for [tablet] and scales up to [desktop] / down to [phone].
enum DeviceBreakpoint { phone, tablet, desktop }

extension ResponsiveExt on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  DeviceBreakpoint get breakpoint {
    final w = screenWidth;
    if (w < AppSizes.phoneMax) return DeviceBreakpoint.phone;
    if (w < AppSizes.tabletMax) return DeviceBreakpoint.tablet;
    return DeviceBreakpoint.desktop;
  }

  // NOTE: GetX's own `ContextExtensionss` already defines `isPhone` / `isTablet`
  // / `isDesktop`, so these use distinct names to avoid an ambiguous-member
  // clash.
  bool get bpIsPhone => breakpoint == DeviceBreakpoint.phone;
  bool get bpIsTablet => breakpoint == DeviceBreakpoint.tablet;
  bool get bpIsDesktop => breakpoint == DeviceBreakpoint.desktop;

  /// `true` for tablet-and-up — the most common branch in layouts.
  bool get isWide => screenWidth >= AppSizes.phoneMax;

  /// Pick a value by breakpoint, falling back to narrower tiers when an upper
  /// tier isn't supplied.
  T responsive<T>({required T phone, T? tablet, T? desktop}) {
    switch (breakpoint) {
      case DeviceBreakpoint.desktop:
        return desktop ?? tablet ?? phone;
      case DeviceBreakpoint.tablet:
        return tablet ?? phone;
      case DeviceBreakpoint.phone:
        return phone;
    }
  }
}

/// Centres its [child] and caps it at [maxWidth] so content stays readable on
/// wide tablets / desktop while still filling phones. Drop this around the body
/// of every screen for consistent gutters.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = AppSizes.contentMaxWidth,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    // `heightFactor: 1` makes the Align shrink-wrap its child's height so this
    // works inside a vertical SingleChildScrollView (where the incoming max
    // height is unbounded). Width still fills, so the child stays centred.
    return Align(
      alignment: alignment,
      heightFactor: 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

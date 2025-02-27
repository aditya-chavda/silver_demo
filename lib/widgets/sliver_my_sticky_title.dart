import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverMyStickyTitle extends SingleChildRenderObjectWidget {
  const SliverMyStickyTitle({super.child, super.key});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderSliverMyStickyTitle();
}

class RenderSliverMyStickyTitle extends RenderSliverSingleBoxAdapter {
  RenderSliverMyStickyTitle({super.child});

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);

    final double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
      case Axis.vertical:
        childExtent = child!.size.height;
    }

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: min(constraints.remainingPaintExtent, childExtent),
      maxPaintExtent: childExtent,
    );

    setChildParentData(child!, constraints, geometry!);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || geometry!.paintExtent == 0.0) return;

    // Get the overlap offset we stored in geometry
    final double overlapOffset = constraints.overlap +
        (constraints.scrollOffset).clamp(0, child!.size.height + 42);

    // Create a clip rect to ensure we don't paint outside our bounds
    context.pushClipRect(
      needsCompositing,
      offset,
      Offset.zero & Size(constraints.crossAxisExtent, geometry!.paintExtent),
      (context, offset) {
        // Apply the overlap transformation
        context.pushTransform(
          needsCompositing,
          offset,
          Matrix4.translationValues(0, overlapOffset, 0),
          super.paint,
        );
      },
      clipBehavior: Clip.none,
    );
  }
}

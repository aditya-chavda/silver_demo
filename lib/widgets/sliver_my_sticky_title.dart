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

    final double childExtent = switch (constraints.axis) {
      Axis.horizontal => child!.size.width,
      Axis.vertical => child!.size.height,
    };
    final double paintedChildSize = calculatePaintOffset(
      constraints,
      from: 0,
      to: constraints.remainingPaintExtent,
    );

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize.clamp(0, childExtent),
      maxPaintExtent: paintedChildSize,
    );

    setChildParentData(child!, constraints, geometry!);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || geometry!.paintExtent == 0.0) return;

    // Get the overlap offset we stored in geometry
    final double overlapOffset = constraints.overlap.clamp(
      0,
      geometry!.maxPaintExtent,
    );

    context.paintChild(child!, offset + Offset(0, overlapOffset));
  }
}

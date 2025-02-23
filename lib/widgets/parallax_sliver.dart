import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ParallaxSliver extends SingleChildRenderObjectWidget {
  final double parallaxFactor;

  const ParallaxSliver({
    Key? key,
    required Widget child,
    this.parallaxFactor = 0.5,
  }) : super(key: key, child: child);

  @override
  RenderParallaxSliver createRenderObject(BuildContext context) =>
      RenderParallaxSliver(parallaxFactor: parallaxFactor);

  @override
  void updateRenderObject(
      BuildContext context, RenderParallaxSliver renderObject) {
    renderObject.parallaxFactor = parallaxFactor;
  }
}

class RenderParallaxSliver extends RenderSliverSingleBoxAdapter {
  RenderParallaxSliver({
    required double parallaxFactor,
  }) : _parallaxFactor = parallaxFactor;

  double _parallaxFactor;

  double get parallaxFactor => _parallaxFactor;

  set parallaxFactor(double value) {
    if (_parallaxFactor == value) return;
    _parallaxFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    // Handle case when there's no child
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    // Calculate the constraints for our child
    // We need to give it unlimited height to allow for the parallax effect
    child!.layout(
      constraints.asBoxConstraints(
        minExtent: constraints.remainingPaintExtent,
        maxExtent: double.infinity,
      ),
      parentUsesSize: true,
    );

    // Get the size of our child
    final double childExtent = child!.size.height;

    // Calculate how much of the sliver should be visible
    final double paintExtent = constraints.remainingPaintExtent;

    // Calculate the scroll offset
    final double scrollOffset = constraints.scrollOffset;

    // Calculate the parallax offset
    // We multiply by (1 - parallaxFactor) to create the sliding effect
    final double parallaxOffset = scrollOffset * (1 - _parallaxFactor);

    geometry = SliverGeometry(
      // The total scrollable extent is the height of our child
      scrollExtent: childExtent,

      // How much space we're actually taking up in the viewport
      paintExtent: paintExtent,

      // The maximum extent we could paint
      maxPaintExtent: childExtent,

      // This is crucial - it determines where we start painting relative to our position
      paintOrigin: paintExtent - childExtent,
      // -childExtent,

      // Store the parallax offset for use during painting
      // We use cacheExtent to pass this data to the paint method
      cacheExtent: parallaxOffset,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || geometry!.paintExtent == 0.0) return;

    // Get the parallax offset we stored in geometry
    final double parallaxOffset = geometry?.cacheExtent ?? 0.0;

    // Create a clip rect to ensure we don't paint outside our bounds
    context.pushClipRect(
      needsCompositing,
      offset,
      Offset.zero & Size(constraints.crossAxisExtent, geometry!.paintExtent),
      (context, offset) {
        // Apply the parallax transformation
        context.pushTransform(
          needsCompositing,
          offset,
          Matrix4.translationValues(0.0, -parallaxOffset, 0.0),
          (context, offset) => super.paint(context, offset),
        );
      },
    );
  }
}

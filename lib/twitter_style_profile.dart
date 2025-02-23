import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'chat_screen.dart';

class TwitterStyleProfile extends StatefulWidget {
  final String username;
  final String headerImageUrl;

  const TwitterStyleProfile({
    Key? key,
    required this.username,
    required this.headerImageUrl,
  }) : super(key: key);

  @override
  State<TwitterStyleProfile> createState() => _TwitterStyleProfileState();
}

class _TwitterStyleProfileState extends State<TwitterStyleProfile>
    with SingleTickerProviderStateMixin {
  final scrollOffset = ValueNotifier(0.0);
  ScrollController? _scrollController;
  static final stickyKey = GlobalKey(debugLabel: 'sticky');
  late final tabController = TabController(length: 4, vsync: this);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() => scrollOffset.value = _scrollController?.offset ?? 0);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        headerSliverBuilder: (context, __) => [
          SliverAppBar(
            pinned: true,
            stretch: true,
            onStretchTrigger: () async {},
            expandedHeight: 200,
            leadingWidth: 54,
            leading: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: CircleIcon(
                icon: Icons.arrow_back,
                onTap: Navigator.of(context).pop,
              ),
            ),
            actions: [
              const CircleIcon(icon: Icons.search),
              const SizedBox(width: 12),
              CircleIcon(
                icon: Icons.chat_bubble_outline_rounded,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ChatScreen(),
                  ),
                ),
              ),
              const SizedBox(width: 18),
            ],
            title: Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: scrollOffset,
                  builder: (context, offset, child) {
                    return Positioned(
                      bottom: (offset - 219).clamp(-150, -10),
                      child: child!,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '20.4K posts',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              onLoadingDone: () {
                _scrollController?.animateTo(
                  332,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInSine,
                );
              },
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Image.network(
                widget.headerImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text('@aditya_chavda'),
                  const SizedBox(height: 16),
                  const Text('Flutter Developer @ Simform Solutions'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      const Text('Ahmedabad, GU'),
                      const SizedBox(width: 20),
                      Transform.rotate(
                        angle: (7 * math.pi) / 4,
                        child: const Icon(
                          Icons.link_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'simform.com',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month_rounded, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('Joined April 2022'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            key: stickyKey,
            delegate: TabBarHeader(tabController),
            pinned: true,
          ),
        ],
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            OverflowBar(
              children: List.generate(
                20,
                (index) => ListTile(
                  title: Text('Content Item ${index + 1}'),
                ),
              ),
            ),
            const Placeholder(),
            const Placeholder(),
            const Placeholder(),
          ],
          // List.generate(
          //   4,
          //       (index) {
          //     return SafeArea(
          //       top: false,
          //       bottom: false,
          //       child: Builder(
          //         // This Builder is needed to provide a BuildContext that is
          //         // "inside" the NestedScrollView, so that
          //         // sliverOverlapAbsorberHandleFor() can find the
          //         // NestedScrollView.
          //         builder: (BuildContext context) {
          //           return CustomScrollView(
          //             // The "controller" and "primary" members should be left
          //             // unset, so that the NestedScrollView can control this
          //             // inner scroll view.
          //             // If the "controller" property is set, then this scroll
          //             // view will not be associated with the NestedScrollView.
          //             // The PageStorageKey should be unique to this ScrollView;
          //             // it allows the list to remember its scroll position when
          //             // the tab view is not on the screen.
          //             key: PageStorageKey<int>(index),
          //             slivers: <Widget>[
          //               SliverOverlapInjector(
          //                 // This is the flip side of the SliverOverlapAbsorber
          //                 // above.
          //                 handle:
          //                 NestedScrollView.sliverOverlapAbsorberHandleFor(
          //                     context),
          //               ),
          //               SliverPadding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 // In this example, the inner scroll view has
          //                 // fixed-height list items, hence the use of
          //                 // SliverFixedExtentList. However, one could use any
          //                 // sliver widget here, e.g. SliverList or SliverGrid.
          //                 sliver: SliverFixedExtentList(
          //                   // The items in this example are fixed to 48 pixels
          //                   // high. This matches the Material Design spec for
          //                   // ListTile widgets.
          //                   itemExtent: 48.0,
          //                   delegate: SliverChildBuilderDelegate(
          //                         (BuildContext context, int index) {
          //                       // This builder is called for each child.
          //                       // In this example, we just number each list item.
          //                       return ListTile(title: Text('Item $index'));
          //                     },
          //                     // The childCount of the SliverChildBuilderDelegate
          //                     // specifies how many children this inner list
          //                     // has. In this example, each tab has a list of
          //                     // exactly 30 items, but this is arbitrary.
          //                     childCount: 30,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    required this.icon,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}

class TabBarHeader extends SliverPersistentHeaderDelegate {
  const TabBarHeader(this.controller);

  final TabController controller;

  static const _size = 48.0;

  @override
  double get maxExtent => _size;

  @override
  double get minExtent => _size;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: Colors.white,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.blue,
        labelColor: Colors.blue,
        splashFactory: NoSplash.splashFactory,
        tabs: const [
          Tab(text: 'Posts'),
          Tab(text: 'Replies'),
          Tab(text: 'Highlights'),
          Tab(text: 'Media'),
        ],
      ),
    );
  }
}

enum LoadingState {
  idle,
  prepare,
  ready,
  loading;

  bool get isIdle => this == idle;

  bool get isPrepare => this == prepare;

  bool get isReady => this == ready;

  bool get isLoading => this == loading;
}

/// The part of a Material Design [AppBar] that expands, collapses, and
/// stretches.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=mSc7qFzxHDw}
///
/// Most commonly used in the [SliverAppBar.flexibleSpace] field, a flexible
/// space bar expands and contracts as the app scrolls so that the [AppBar]
/// reaches from the top of the app to the top of the scrolling contents of the
/// app. When using [SliverAppBar.flexibleSpace], the [SliverAppBar.expandedHeight]
/// must be large enough to accommodate the [SliverAppBar.flexibleSpace] widget.
///
/// Furthermore is included functionality for stretch behavior. When
/// [SliverAppBar.stretch] is true, and your [ScrollPhysics] allow for
/// overscroll, this space will stretch with the overscroll.
///
/// The widget that sizes the [AppBar] must wrap it in the widget returned by
/// [FlexibleSpaceBar.createSettings], to convey sizing information down to the
/// [FlexibleSpaceBar].
///
/// {@tool dartpad}
/// This sample application demonstrates the different features of the
/// [FlexibleSpaceBar] when used in a [SliverAppBar]. This app bar is configured
/// to stretch into the overscroll space, and uses the
/// [FlexibleSpaceBar.stretchModes] to apply `fadeTitle`, `blurBackground` and
/// `zoomBackground`. The app bar also makes use of [CollapseMode.parallax] by
/// default.
///
/// ** See code in examples/api/lib/material/flexible_space_bar/flexible_space_bar.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [SliverAppBar], which implements the expanding and contracting.
///  * [AppBar], which is used by [SliverAppBar].
///  * <https://material.io/design/components/app-bars-top.html#behavior>
class FlexibleSpaceBar extends StatefulWidget {
  /// Creates a flexible space bar.
  ///
  /// Most commonly used in the [AppBar.flexibleSpace] field.
  const FlexibleSpaceBar({
    super.key,
    this.title,
    this.background,
    this.centerTitle,
    this.titlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    this.expandedTitleScale = 1.5,
    this.onLoadingDone,
  }) : assert(expandedTitleScale >= 1);

  final VoidCallback? onLoadingDone;

  /// The primary contents of the flexible space bar when expanded.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Shown behind the [title] when expanded.
  ///
  /// Typically an [Image] widget with [Image.fit] set to [BoxFit.cover].
  final Widget? background;

  /// Whether the title should be centered.
  ///
  /// By default this property is true if the current target platform
  /// is [TargetPlatform.iOS] or [TargetPlatform.macOS], false otherwise.
  final bool? centerTitle;

  /// Collapse effect while scrolling.
  ///
  /// Defaults to [CollapseMode.parallax].
  final CollapseMode collapseMode;

  /// Stretch effect while over-scrolling.
  ///
  /// Defaults to include [StretchMode.zoomBackground].
  final List<StretchMode> stretchModes;

  /// Defines how far the [title] is inset from either the widget's
  /// bottom-left or its center.
  ///
  /// Typically this property is used to adjust how far the title is
  /// inset from the bottom-left and it is specified along with
  /// [centerTitle] false.
  ///
  /// By default the value of this property is
  /// `EdgeInsetsDirectional.only(start: 72, bottom: 16)` if the title is
  /// not centered, `EdgeInsetsDirectional.only(start: 0, bottom: 16)` otherwise.
  final EdgeInsetsGeometry? titlePadding;

  /// Defines how much the title is scaled when the FlexibleSpaceBar is expanded
  /// due to the user scrolling downwards. The title is scaled uniformly on the
  /// x and y axes while maintaining its bottom-left position (bottom-center if
  /// [centerTitle] is true).
  ///
  /// Defaults to 1.5 and must be greater than 1.
  final double expandedTitleScale;

  /// Wraps a widget that contains an [AppBar] to convey sizing information down
  /// to the [FlexibleSpaceBar].
  ///
  /// Used by [Scaffold] and [SliverAppBar].
  ///
  /// `toolbarOpacity` affects how transparent the text within the toolbar
  /// appears. `minExtent` sets the minimum height of the resulting
  /// [FlexibleSpaceBar] when fully collapsed. `maxExtent` sets the maximum
  /// height of the resulting [FlexibleSpaceBar] when fully expanded.
  /// `currentExtent` sets the scale of the [FlexibleSpaceBar.background] and
  /// [FlexibleSpaceBar.title] widgets of [FlexibleSpaceBar] upon
  /// initialization. `scrolledUnder` is true if the [FlexibleSpaceBar]
  /// overlaps the app's primary scrollable, false if it does not, and null
  /// if the caller has not determined as much.
  /// See also:
  ///
  ///  * [FlexibleSpaceBarSettings] which creates a settings object that can be
  ///    used to specify these settings to a [FlexibleSpaceBar].
  static Widget createSettings({
    double? toolbarOpacity,
    double? minExtent,
    double? maxExtent,
    bool? isScrolledUnder,
    bool? hasLeading,
    required double currentExtent,
    required Widget child,
  }) {
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      isScrolledUnder: isScrolledUnder,
      hasLeading: hasLeading,
      currentExtent: currentExtent,
      child: child,
    );
  }

  @override
  State<FlexibleSpaceBar> createState() => _FlexibleSpaceBarState();
}

class _FlexibleSpaceBarState extends State<FlexibleSpaceBar>
    with SingleTickerProviderStateMixin {
  var loadingState = LoadingState.idle;

  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
    lowerBound: 0,
    upperBound: 0.5,
  );

  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null) {
      return widget.centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle) {
      return Alignment.bottomCenter;
    }
    final TextDirection textDirection = Directionality.of(context);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
  }

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final FlexibleSpaceBarSettings settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final List<Widget> children = <Widget>[];

        final double deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final double t = ui.clampDouble(
            1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent,
            0.0,
            1.0);

        // background
        if (widget.background != null) {
          final double fadeStart =
              math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const double fadeEnd = 1.0;
          assert(fadeStart <= fadeEnd);
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          final double opacity = settings.maxExtent == settings.minExtent
              ? 1.0
              : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          double height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (widget.stretchModes.contains(StretchMode.zoomBackground) &&
              constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }
          final double topPadding = _getCollapsePadding(t, settings);
          children.add(Positioned(
            top: topPadding,
            left: 0.0,
            right: 0.0,
            height: height,
            child: _FlexibleSpaceHeaderOpacity(
                // IOS is relying on this semantics node to correctly traverse
                // through the app bar when it is collapsed.
                alwaysIncludeSemantics: true,
                opacity: opacity,
                child: widget.background),
          ));

          // StretchMode.blurBackground
          if (widget.stretchModes.contains(StretchMode.blurBackground) &&
              constraints.maxHeight > (settings.maxExtent - 20)) {
            final double blurAmount =
                (constraints.maxHeight - settings.maxExtent) / 4;
            children.add(Positioned.fill(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ));
          }

          final loadingExtent = ui.clampDouble(
            (constraints.maxHeight - settings.currentExtent) / 20,
            0,
            4,
          );

          if ((constraints.maxHeight - settings.currentExtent) > 5) {
            if (loadingState.isIdle && loadingExtent >= 2.5) {
              loadingState = LoadingState.prepare;
            }

            if (!controller.isAnimating && loadingState.isPrepare) {
              controller
                  .forward()
                  .then((_) => loadingState = LoadingState.ready);
            }

            if (loadingState.isIdle || loadingState.isPrepare) {
              children.add(
                Positioned(
                  key: const ValueKey(LoadingState.prepare),
                  left: 0.0,
                  right: 0.0,
                  height: height,
                  child: RotationTransition(
                    turns: controller,
                    child: Opacity(
                      opacity: loadingExtent.clamp(0, 1),
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }

            if (loadingState.isReady || loadingState.isLoading) {
              final key = children.lastOrNull?.key;
              if (key is ValueKey && key.value == LoadingState.prepare) {
                children.removeLast();
              }

              loadingState = LoadingState.loading;

              children.add(
                Positioned(
                  key: const ValueKey(LoadingState.loading),
                  left: 0,
                  right: 0,
                  height: height,
                  child: const CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 15,
                  ),
                ),
              );
            }
          } else if (loadingState.isLoading) {
            print('here ${loadingState.name} $loadingExtent');
            final key = children.lastOrNull?.key;
            if (key is ValueKey && key.value == LoadingState.loading) {
              children.removeLast();
            }

            controller.reset();
            widget.onLoadingDone?.call();
            loadingState = LoadingState.idle;
          }
        }

        // title
        if (widget.title != null) {
          final ThemeData theme = Theme.of(context);

          Widget? title;
          switch (theme.platform) {
            case TargetPlatform.iOS:
            case TargetPlatform.macOS:
              title = widget.title;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
            case TargetPlatform.linux:
            case TargetPlatform.windows:
              title = Semantics(
                namesRoute: true,
                child: widget.title,
              );
          }

          // StretchMode.fadeTitle
          if (widget.stretchModes.contains(StretchMode.fadeTitle) &&
              constraints.maxHeight > settings.maxExtent) {
            final double stretchOpacity = 1 -
                ui.clampDouble(
                    (constraints.maxHeight - settings.maxExtent) / 100,
                    0.0,
                    1.0);
            title = Opacity(
              opacity: stretchOpacity,
              child: title,
            );
          }

          final double opacity = settings.toolbarOpacity;
          if (opacity > 0.0) {
            TextStyle titleStyle = theme.primaryTextTheme.titleLarge!;
            titleStyle = titleStyle.copyWith(
              color: titleStyle.color!.withOpacity(opacity),
            );
            final bool effectiveCenterTitle = _getEffectiveCenterTitle(theme);
            final EdgeInsetsGeometry padding = widget.titlePadding ??
                EdgeInsetsDirectional.only(
                  start: effectiveCenterTitle && !(settings.hasLeading ?? false)
                      ? 0.0
                      : 72.0,
                  bottom: 16.0,
                );
            final double scaleValue =
                Tween<double>(begin: widget.expandedTitleScale, end: 1.0)
                    .transform(t);
            final Matrix4 scaleTransform = Matrix4.identity()
              ..scale(scaleValue, scaleValue, 1.0);
            final Alignment titleAlignment =
                _getTitleAlignment(effectiveCenterTitle);
            children.add(Container(
              padding: padding,
              child: Transform(
                alignment: titleAlignment,
                transform: scaleTransform,
                child: Align(
                  alignment: titleAlignment,
                  child: DefaultTextStyle(
                    style: titleStyle,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          width: constraints.maxWidth / scaleValue,
                          alignment: titleAlignment,
                          child: title,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
          }
        }

        return ClipRect(child: Stack(children: children));
      },
    );
  }
}

// We need the child widget to repaint, however both the opacity
// and potentially `widget.background` can be constant which won't
// lead to repainting.
// see: https://github.com/flutter/flutter/issues/127836
class _FlexibleSpaceHeaderOpacity extends SingleChildRenderObjectWidget {
  const _FlexibleSpaceHeaderOpacity(
      {required this.opacity,
      required super.child,
      required this.alwaysIncludeSemantics});

  final double opacity;
  final bool alwaysIncludeSemantics;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderFlexibleSpaceHeaderOpacity(
        opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant _RenderFlexibleSpaceHeaderOpacity renderObject) {
    renderObject
      ..alwaysIncludeSemantics = alwaysIncludeSemantics
      ..opacity = opacity;
  }
}

class _RenderFlexibleSpaceHeaderOpacity extends RenderOpacity {
  _RenderFlexibleSpaceHeaderOpacity({
    super.opacity,
    super.alwaysIncludeSemantics,
  });

  @override
  bool get isRepaintBoundary => false;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    if (opacity == 0) {
      layer = null;
      return;
    }
    assert(needsCompositing);
    layer = context.pushOpacity(offset, (opacity * 255).round(), super.paint,
        oldLayer: layer as OpacityLayer?);
    assert(() {
      layer!.debugCreator = debugCreator;
      return true;
    }());
  }
}

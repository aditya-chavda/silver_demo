import 'package:flutter/material.dart';

import '../widgets/circle_icon.dart';
import '../widgets/my_flexible_space_bar.dart';
import '../widgets/twitter_profile_header.dart';
import '../widgets/twitter_profile_title.dart';
import 'chat_screen.dart';

class TwitterStyleProfile extends StatefulWidget {
  const TwitterStyleProfile({
    required this.username,
    required this.headerImageUrl,
    super.key,
  });

  final String username;
  final String headerImageUrl;

  @override
  State<TwitterStyleProfile> createState() => _TwitterStyleProfileState();
}

class _TwitterStyleProfileState extends State<TwitterStyleProfile>
    with SingleTickerProviderStateMixin {
  final scrollOffset = ValueNotifier(0.0);
  late final tabController = TabController(length: 4, vsync: this);
  late final ScrollController _scrollController = ScrollController()
    ..addListener(() => scrollOffset.value = _scrollController.offset);

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
            title: TwitterProfileTitle(
              name: widget.username,
              scrollOffset: scrollOffset,
            ),
            flexibleSpace: MyFlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Image.network(
                widget.headerImageUrl,
                fit: BoxFit.cover,
              ),
              onLoadingDone: _onReload,
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: CircleIcon(
                icon: Icons.arrow_back,
                onTap: Navigator.of(context).pop,
              ),
            ),
            actions: _getActions(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: TwitterProfileHeader(name: widget.username),
            ),
          ),
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: TabBarHeader(tabController),
            ),
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: _getTabsContent(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Widget> _getTabsContent() {
    //return [
    //   OverflowBar(
    //     children: List.generate(
    //       20,
    //           (index) => ListTile(
    //         title: Text('Content Item ${index + 1}'),
    //       ),
    //     ),
    //   ),
    //   const Placeholder(),
    //   const Placeholder(),
    //   const Placeholder(),
    // ]
    return List.generate(
      4,
      (index) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) => CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    childCount: 30,
                    (_, index) => ListTile(
                      title: Text('Content Item $index'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return [
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
    ];
  }

  void _onReload() {
    _scrollController.animateTo(
      332,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInSine,
    );
  }
}

class TabBarHeader extends SliverPersistentHeaderDelegate {
  const TabBarHeader(this.controller);

  final TabController controller;

  static const double _size = 48;

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

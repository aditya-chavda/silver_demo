import 'package:flutter/material.dart';

import '../extensions.dart';
import '../models/post.dart';
import '../widgets/circle_icon.dart';
import '../widgets/my_flexible_space_bar.dart';
import '../widgets/post_footer_icon.dart';
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
                SectionPost(
                  title: 'Trending',
                  posts: _getTrendingPosts(),
                ),
                SectionPost(
                  title: 'Most Viewed',
                  posts: _getMostViewedPosts(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Post> _getTrendingPosts() {
    return [
      Post(
        authorName: 'John',
        authorUsername: '@john.doe',
        authorPic: 'https://randomuser.me/api/portraits/thumb/men/3.jpg',
        imageUrl:
            'https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_648d8c973092f153b4a34507_Integrating_AI_into_Flutter_Unlocking_New_Possibilities_for_Mobile_Development_OG_Image_b8b8b32d08.jpg',
        content:
            "AI-powered mobile apps are changing the way we live! From voice "
            "assistants to smart recommendations, AI is making our phones"
            " smarter than ever. What’s your favorite AI-powered app? 🤔📱 "
            "\n#ArtificialIntelligence #MobileTech",
        postedAt: DateTime.now(),
      ),
    ];
  }

  List<Post> _getMostViewedPosts() {
    return [
      Post(
        authorName: 'Emily',
        authorUsername: '@emily_smith',
        authorPic: 'https://randomuser.me/api/portraits/thumb/women/11.jpg',
        imageUrl:
            'https://assets.asana.biz/transform/aa4ae547-d8a5-430a-a87d-8c8124360fdf/article-productivity-pareto-principle-80-20-rule-2x',
        content:
            "Want to stay productive? Use the 80/20 rule! Focus on tasks that"
            " bring 80% of the results. Work smarter, not harder! ✅ "
            "What’s your best productivity hack? \n#WorkSmart #ProductivityTips",
        postedAt: DateTime.now(),
      ),
      Post(
        authorName: 'Katty',
        authorUsername: '@kattyP',
        authorPic: 'https://randomuser.me/api/portraits/thumb/women/10.jpg',
        imageUrl: 'https://i.ytimg.com/vi/9bPBWfpO-fA/maxresdefault.jpg',
        content:
            "Coding isn’t just a skill; it’s a superpower! 💡 Every great developer you admire once started with ‘Hello, World!’ Keep learning, keep building! 🚀 #CodeNewbie #DeveloperLife",
        postedAt: DateTime.now(),
      ),
    ];
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

class SectionPost extends StatelessWidget {
  const SectionPost({
    required this.title,
    required this.posts,
    super.key,
  });

  final String title;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: 0,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => Divider(
              height: 42,
              color: Colors.grey.shade300,
            ),
            itemBuilder: (_, index) {
              final post = posts[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: post.authorPic.isEmpty
                          ? null
                          : NetworkImage(post.authorPic),
                      child: post.authorPic.isEmpty
                          ? const Icon(Icons.person, size: 28)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              post.authorName,
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${post.authorUsername} • ${post.postedAt.format()}',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          post.content,
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (post.imageUrl.isNotEmpty)
                          Container(
                            width: double.maxFinite,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image: NetworkImage(post.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PostFooterIcon(
                              icon: Icons.chat_bubble_outline_rounded,
                            ),
                            PostFooterIcon(icon: Icons.autorenew_rounded),
                            PostFooterIcon(
                              icon: Icons.favorite_border_rounded,
                            ),
                            PostFooterIcon(icon: Icons.bar_chart_outlined),
                            PostFooterIcon(
                              icon: Icons.bookmark_border_rounded,
                              quantized: false,
                            ),
                            PostFooterIcon(
                              icon: Icons.file_upload_outlined,
                              quantized: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/post.dart';
import '../widgets/circle_icon.dart';
import '../widgets/my_flexible_space_bar.dart';
import '../widgets/twitter_post_tile.dart';
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
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
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: TwitterProfileHeader(name: widget.username),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TabBarHeader(tabController),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: _getTabsContent(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Widget> _getTabsContent() {
    return List.generate(
      4,
      (index) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) => CustomScrollView(
              slivers: <Widget>[
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
              return TwitterPostTile(post: post);
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

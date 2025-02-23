import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            foregroundColor: Colors.lightBlue,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
            surfaceTintColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/459/528/47/faces-syringe-piling-up-figures-wallpaper-preview.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(_getFormWidgets()),
            ),
          ),
          const StickyCodeGroup(
            title: 'Security Code',
            color: Colors.lightBlue,
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          const StickyCodeGroup(
            title: 'Personal Code',
            color: Colors.orange,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getFormWidgets() {
    return const [
      Text(
        'Hello',
        style: TextStyle(fontSize: 42),
      ),
      SizedBox(height: 32),
      Text(
        'Username',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 12),
      TextField(
        decoration: InputDecoration(
          hintText: 'Enter your username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Password',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 12),
      TextField(
        decoration: InputDecoration(
          hintText: 'Enter your password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
    ];
  }
}

class StickyCodeGroup extends StatelessWidget {
  const StickyCodeGroup({
    required this.title,
    required this.color,
    this.margin = const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    super.key,
  });

  final String title;
  final MaterialColor color;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: margin,
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeader(title),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 18,
              (context, index) => Container(
                alignment: Alignment.center,
                color: color[100 * ((index + 1) % 9)],
                child: Text('$index'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StickyHeader extends SliverPersistentHeaderDelegate {
  const StickyHeader(
    this.title, {
    this.padding,
    this.overlapMargin,
    this.size = 63.0,
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  });

  final String title;
  final double size;
  final EdgeInsets? padding;
  final EdgeInsets? overlapMargin;
  final TextStyle textStyle;

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

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
    return Container(
      // margin: overlapsContent ? overlapMargin : null,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(top: 42),
        child: Text(title, style: textStyle),
      ),
    );
  }
}

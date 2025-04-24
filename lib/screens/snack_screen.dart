import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../static_data.dart';
import '../widgets/section_title.dart';
import '../widgets/sliver_my_sticky_title.dart';
import '../widgets/snack_header.dart';
import '../widgets/snack_profile.dart';
import 'chat_screen.dart';

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ChatScreen(),
          ),
        ),
        child: const Icon(
          Icons.support_agent_outlined,
          size: 42,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 236,
            automaticallyImplyLeading: false,
            backgroundColor: CupertinoColors.systemOrange.darkColor,
            surfaceTintColor: CupertinoColors.systemOrange.darkColor,
            flexibleSpace: const FlexibleSpaceBar(
              background: SnackProfile(),
            ),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: SnackHeader(),
            ),
          ),
          ...List.generate(
            homeData.length,
            (index) => CategorySectionGrid(category: homeData[index]),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),
        ],
      ),
    );
  }
}

class CategorySectionGrid extends StatelessWidget {
  const CategorySectionGrid({
    required this.category,
    super.key,
  });

  final CategoryDm category;

  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    return SliverMainAxisGroup(
      slivers: [
        // Issue: https://github.com/flutter/flutter/issues/134535
        SliverMyStickyTitle(
          child: SectionTitle(name: category.name),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              mainAxisExtent: 135,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: subcategories.length,
              (_, index) {
                final data = subcategories[index];
                return _getGridItems(data);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyHeader extends SliverPersistentHeaderDelegate {
  const MyHeader(this.name);

  final String name;

  static const double _size = 49;

  @override
  double get maxExtent => _size;

  @override
  double get minExtent => _size;

  @override
  bool shouldRebuild(MyHeader oldDelegate) => oldDelegate.name != name;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SectionTitle(
      name: name,
      showShadow: shrinkOffset > 0,
    );
  }
}

Widget _getGridItems(SubcategoryDm data) {
  return Column(
    children: [
      Expanded(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 8,
          ),
          decoration: const BoxDecoration(
            color: CupertinoColors.extraLightBackgroundGray,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          child: Image.network(data.imageUrl),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        data.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          height: 1.4,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

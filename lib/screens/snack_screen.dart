import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../static_data.dart';
import '../widgets/sliver_my_sticky_title.dart';
import '../widgets/snack_header.dart';
import '../widgets/snack_profile.dart';

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            automaticallyImplyLeading: false,
            backgroundColor: CupertinoColors.systemOrange.darkColor,
            flexibleSpace: const FlexibleSpaceBar(
              background: SnackProfile(),
            ),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 120),
              child: SnackHeader(),
            ),
          ),
          ...List.generate(
            homeData.length,
            (index) => CategoryGrid(category: homeData[index]),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    required this.category,
    super.key,
  });

  final CategoryDm category;

  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverMyStickyTitle(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 14)),
          SliverGrid(
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
                        // child: Image.network(data.imageUrl),
                        child: Image.network(
                          'https://m.media-amazon.com/images/I/61iL96yYQsL.jpg',
                        ),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'twitter_style_profile.dart' hide FlexibleSpaceBar;

const homeData = [
  CategoryDm(
    id: "101",
    name: "Grocery & Kitchen",
    subcategories: [
      SubcategoryDm(
          name: "Vegetables & Fruits",
          imageUrl: "https://example.com/fresh-fruits.jpg"),
      SubcategoryDm(
          name: "Atta, Rice & Dal",
          imageUrl: "https://example.com/fresh-vegetables.jpg"),
      SubcategoryDm(
          name: "Oil, Ghee & Masala",
          imageUrl: "https://example.com/exotic-fruits.jpg"),
      SubcategoryDm(
          name: "Dairy, Bread & Eggs",
          imageUrl: "https://example.com/exotic-vegetables.jpg"),
      SubcategoryDm(
          name: "Bakery & Biscuits",
          imageUrl: "https://example.com/organic-fruits.jpg"),
      SubcategoryDm(
          name: "Dry Fruits & Cereals",
          imageUrl: "https://example.com/organic-vegetables.jpg"),
      SubcategoryDm(
          name: "Kitchenware & Appliances",
          imageUrl: "https://example"
              ".com/cut-peeled"
              ".jpg"),
      SubcategoryDm(
          name: "Herbs & Seasoning",
          imageUrl: "https://example.com/herbs-seasoning.jpg"),
    ],
  ),
  CategoryDm(
    id: "103",
    name: "Snacks & Drinks",
    subcategories: [
      SubcategoryDm(
          name: "Chips & Namkeen", imageUrl: "https://example.com/chips.jpg"),
      SubcategoryDm(
          name: "Biscuits & Cookies",
          imageUrl: "https://example.com/biscuits.jpg"),
      SubcategoryDm(
          name: "Chocolates & Sweets",
          imageUrl: "https://example.com/chocolates.jpg"),
      SubcategoryDm(
          name: "Drinks & Juices", imageUrl: "https://example.com/juices.jpg"),
      SubcategoryDm(
          name: "Tea, Coffee & Milk Drinks",
          imageUrl: "https://example"
              ".com/tea-coffee.jpg"),
      SubcategoryDm(
          name: "Ice creams & More",
          imageUrl: "https://example.com/energy-drinks.jpg"),
      SubcategoryDm(
          name: "Instant Food & Soups",
          imageUrl: "https://example.com/noodles.jpg"),
      SubcategoryDm(
          name: "Dry Fruits & Nuts",
          imageUrl: "https://example.com/dry-fruits.jpg"),
    ],
  ),
  CategoryDm(
    id: "104",
    name: "Household Essentials",
    subcategories: [
      SubcategoryDm(
          name: "Detergents & Dishwash",
          imageUrl: "https://example.com/detergents.jpg"),
      SubcategoryDm(
          name: "Room & Car Fresheners",
          imageUrl: "https://example.com/cleaning-supplies.jpg"),
      SubcategoryDm(
          name: "Paper & Disposables",
          imageUrl: "https://example.com/paper.jpg"),
      SubcategoryDm(
          name: "Cleaners & Repellents",
          imageUrl: "https://example.com/air-fresheners.jpg"),
      SubcategoryDm(
          name: "Stationery & Games",
          imageUrl: "https://example.com/storage"
              ".jpg"),
      SubcategoryDm(
          name: "Home & Lifestyle", imageUrl: "https://example.com/pooja.jpg"),
      SubcategoryDm(
          name: "Batteries & Electricals",
          imageUrl: "https://example.com/batteries.jpg"),
      SubcategoryDm(
          name: "Kitchen Essentials",
          imageUrl: "https://example.com/kitchen.jpg"),
    ],
  ),
  CategoryDm(
    id: "102",
    name: "Dairy & Milk",
    subcategories: [
      SubcategoryDm(name: "Milk", imageUrl: "https://example.com/milk.jpg"),
      SubcategoryDm(name: "Cheese", imageUrl: "https://example.com/cheese.jpg"),
      SubcategoryDm(name: "Butter", imageUrl: "https://example.com/butter.jpg"),
      SubcategoryDm(
          name: "Yogurt & Curd", imageUrl: "https://example.com/yogurt.jpg"),
      SubcategoryDm(
          name: "Paneer & Soya Chunks",
          imageUrl: "https://example.com/paneer"
              ".jpg"),
      SubcategoryDm(
          name: "Breads & Buns", imageUrl: "https://example.com/bread.jpg"),
      SubcategoryDm(
          name: "Cakes & Pastries", imageUrl: "https://example.com/cakes.jpg"),
      SubcategoryDm(
          name: "Cookies & Rusk", imageUrl: "https://example.com/cookies.jpg"),
    ],
  ),
];

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
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
              // ProductCard(
              //   detail: ProductDetails(
              //     image:
              //         'https://www.hersheyland.in/content/dam/Hersheyland_India/en_in/products/kisses/kisses-cnc-33.6g-FOP.png',
              //     title: 'Ferrero Rocher Chocolate Gift Pack (16 pieces)',
              //     stars: 4.5,
              //     totalRatings: 5727,
              //     price: 589,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

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
        (constraints.scrollOffset).clamp(0, child!.size.height + 18);

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

class CategoryDm {
  const CategoryDm({
    required this.id,
    required this.name,
    required this.subcategories,
  });

  final String id;
  final String name;
  final List<SubcategoryDm> subcategories;
}

class SubcategoryDm {
  const SubcategoryDm({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;
}

class SnackProfile extends StatelessWidget {
  const SnackProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Blinkit in',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  '15 minutes',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Simform - ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: 'Aditya Chavda',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: CircleIcon(
              icon: Icons.person,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TwitterStyleProfile(
                    username: 'Aditya',
                    headerImageUrl:
                        "https://t4.ftcdn.net/jpg/02/56/10/07/360_F_256100731_qNLp6MQ3FjYtA3Freu9epjhsAj2cwU9c.jpg",
// 'https://media.triumphmotorcycles.co.uk/image/upload/f_auto/q_auto:eco/sitecoremedialibrary/media-library/images/motorcycles/modern-classics/t%20series/speed%20400/speed%20400%20family%20page/speed-400-my24-family-timeline-1-revised-1920x780.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackHeader extends StatelessWidget {
  const SnackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 22),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 28),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Search "chocolates"',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: Transform.rotate(
                    angle: pi * 0.5,
                    child: Divider(color: Colors.grey.shade300),
                  ),
                ),
                const Icon(Icons.mic, size: 28),
              ],
            ),
          ),
          SizedBox(
            height: 72,
            child: ListView.separated(
              itemCount: 8,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 32),
              itemBuilder: (_, __) => const Column(
                children: [
                  Icon(Icons.headphones_outlined, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Electronics',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetails {
  const ProductDetails({
    required this.image,
    required this.title,
    required this.stars,
    required this.totalRatings,
    required this.price,
  });

  final String image;
  final String title;
  final double stars;
  final int totalRatings;
  final int price;
}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.detail, super.key});

  final ProductDetails detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 22,
                ),
                decoration: const BoxDecoration(
                  color: CupertinoColors.extraLightBackgroundGray,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.network(detail.image),
              ),
              Positioned(
                right: 0,
                bottom: -6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.lightGreen),
                    ),
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          detail.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('⭐' * detail.stars.toInt()),
            const SizedBox(width: 4),
            Text('(${detail.totalRatings})'),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '\$${detail.price}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

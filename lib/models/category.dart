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

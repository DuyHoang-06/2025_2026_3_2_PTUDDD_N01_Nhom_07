class Recipe {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int cookingTime;
  final int calories;
  final String category;

  /// Khoá dịch của category (ví dụ 'ai_cat_quick').
  /// Dùng để lọc / so sánh danh mục mà không phụ thuộc ngôn ngữ.
  final String categoryKey;

  final List<String> ingredients;
  final List<String> steps;

  /// Tên món ăn song ngữ (hiển thị theo locale hiện tại).
  final String nameVi;
  final String nameEn;

  /// Nguyên liệu và các bước song ngữ.
  /// Mỗi danh sách có độ dài bằng nhau, phần tử cùng index tương ứng nhau.
  final List<String> ingredientsVi;
  final List<String> ingredientsEn;
  final List<String> stepsVi;
  final List<String> stepsEn;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.cookingTime,
    required this.calories,
    required this.category,
    required this.categoryKey,
    required this.ingredients,
    required this.steps,
    required this.nameVi,
    required this.nameEn,
    required this.ingredientsVi,
    required this.ingredientsEn,
    required this.stepsVi,
    required this.stepsEn,
  });
}
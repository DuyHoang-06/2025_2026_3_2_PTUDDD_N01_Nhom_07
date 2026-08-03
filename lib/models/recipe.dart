class Recipe {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int cookingTime;
  final int calories;
  final String category;

  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.cookingTime,
    required this.calories,
    required this.category,
    required this.ingredients,
    required this.steps,
  });
}

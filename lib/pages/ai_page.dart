import 'package:flutter/material.dart';
import '../data/fake_recipe.dart';
import '../models/recipe.dart';
import '../widgets/language_provider.dart';
import 'recipe_detail_page.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
      static const _categoryKeys = ['all', 'ai_cat_quick', 'ai_cat_healthy', 'ai_cat_korean'];

  String _selectedCategoryKey = 'all';

        List<Recipe> get _filteredRecipes {
    final tr = LanguageProvider.t(context);
    if (_selectedCategoryKey == 'all') {
      return fakeRecipes;
    }

        final Map<String, String> categoryMap = {
      'ai_cat_quick': tr.text('ai_cat_quick'),       'ai_cat_healthy': tr.text('ai_cat_healthy'),       'ai_cat_korean': tr.text('ai_cat_korean'),     };

    final selectedLabel = categoryMap[_selectedCategoryKey];
    return fakeRecipes.where((recipe) {
      return recipe.category == selectedLabel;
    }).toList();
  }

        @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAF6),

      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCategoryFilter(),
            Expanded(child: _buildRecipeGrid()),
          ],
        ),
      ),
    );
  }

        Widget _buildHeader() {
    final tr = LanguageProvider.t(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          tr.text('ai_title'),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),
      ),
    );
  }

        Widget _buildSearchBar() {
    final tr = LanguageProvider.t(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        height: 38,

        decoration: BoxDecoration(
          color: const Color(0xffEAF3EC),
          borderRadius: BorderRadius.circular(20),
        ),

        child: TextField(
          decoration: InputDecoration(
            hintText: tr.text('ai_search_hint'),
            hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),

            prefixIcon:
                const Icon(Icons.search, size: 16, color: Colors.grey),

            border: InputBorder.none,

            contentPadding: const EdgeInsets.symmetric(vertical: 5),
          ),
        ),
      ),
    );
  }

        Widget _buildCategoryFilter() {
    final tr = LanguageProvider.t(context);
    return SizedBox(
      height: 38,

      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        scrollDirection: Axis.horizontal,

        itemCount: _categoryKeys.length,

        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },

        itemBuilder: (context, index) {
          final key = _categoryKeys[index];
          final label = tr.text(key);
          final selected = key == _selectedCategoryKey;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryKey = key;
              });
            },

            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

              decoration: BoxDecoration(
                color: selected ? const Color(0xff4CAF50) : Colors.white,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: selected
                      ? const Color(0xff4CAF50)
                      : const Color(0xffE2EAE3),
                ),
              ),

              child: Text(
                label,

                style: TextStyle(
                  fontSize: 10,

                  fontWeight: FontWeight.w600,

                  color: selected ? Colors.white : const Color(0xff657067),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

        Widget _buildRecipeGrid() {
    final recipes = _filteredRecipes;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 10,

        mainAxisSpacing: 10,

        childAspectRatio: 0.78,
      ),

      itemCount: recipes.length,

      itemBuilder: (context, index) {
        final recipe = recipes[index];

        return _buildRecipeCard(recipe);
      },
    );
  }

        Widget _buildRecipeCard(Recipe recipe) {
    final tr = LanguageProvider.t(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(recipe: recipe),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(color: const Color(0xffE5EAE6)),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),

                    child: Image.asset(
                      recipe.image,

                      width: double.infinity,

                      height: double.infinity,

                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 6,
                    right: 6,

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.orange,
                          ),

                          const SizedBox(width: 2),

                          Text(
                            recipe.rating.toString(),

                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    recipe.name,

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 10,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 3),

                      Text(
                        '${recipe.cookingTime} ${tr.text('ai_minutes')}',

                        style: const TextStyle(
                            fontSize: 8, color: Colors.grey),
                      ),

                      const SizedBox(width: 8),

                      const Icon(
                        Icons.local_fire_department,
                        size: 10,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 3),

                      Text(
                        '${recipe.calories} ${tr.text('ai_kcal')}',

                        style: const TextStyle(
                            fontSize: 8, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

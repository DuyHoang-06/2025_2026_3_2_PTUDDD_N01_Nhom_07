import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/language_provider.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAF6),

      body: SafeArea(
        child: Column(
          children: [
            _buildTopImage(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    _buildRecipeInfo(),

                    const SizedBox(height: 24),

                    _buildIngredients(),

                    const SizedBox(height: 24),

                    _buildSteps(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

        Widget _buildTopImage() {
    return SizedBox(
      height: 190,
      width: double.infinity,

      child: Stack(
        children: [
          Image.asset(
            widget.recipe.image,

            width: double.infinity,
            height: double.infinity,

            fit: BoxFit.cover,
          ),

                    Positioned(
            top: 12,
            left: 12,

            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },

              child: Container(
                width: 32,
                height: 32,

                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),

                    Positioned(
            top: 12,
            right: 12,

            child: GestureDetector(
              onTap: () {
                              },

              child: Container(
                width: 32,
                height: 32,

                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

        Widget _buildRecipeInfo() {
    final tr = LanguageProvider.t(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          tr.locale == 'en' ? widget.recipe.nameEn : widget.recipe.nameVi,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            _buildInfoItem(
              icon: Icons.star,
              value: widget.recipe.rating.toString(),
              color: Colors.orange,
            ),

            const SizedBox(width: 16),

            _buildInfoItem(
              icon: Icons.access_time,
              value:
                  '${widget.recipe.cookingTime} ${tr.text('ai_minutes')}',
              color: Colors.grey,
            ),

            const SizedBox(width: 16),

            _buildInfoItem(
              icon: Icons.local_fire_department,
              value: '${widget.recipe.calories} ${tr.text('ai_kcal')}',
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

        Widget _buildInfoItem({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        Icon(icon, size: 14, color: color),

        const SizedBox(width: 4),

        Text(
          value,

          style: const TextStyle(fontSize: 10, color: Color(0xff657067)),
        ),
      ],
    );
  }

        Widget _buildIngredients() {
    final tr = LanguageProvider.t(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          tr.text('recipe_ingredients'),

          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 10),

        ...() {
          final list = tr.locale == 'en'
              ? widget.recipe.ingredientsEn
              : widget.recipe.ingredientsVi;
          return list.map((ingredient) {
            return _buildIngredientItem(ingredient);
          });
        }(),
      ],
    );
  }

        Widget _buildIngredientItem(String ingredient) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 5,
            height: 5,

            margin: const EdgeInsets.only(top: 6, right: 8),

            decoration: const BoxDecoration(
              color: Color(0xff4CAF50),
              shape: BoxShape.circle,
            ),
          ),

          Expanded(
            child: Text(
              ingredient,

              style: const TextStyle(fontSize: 11, color: Color(0xff657067)),
            ),
          ),
        ],
      ),
    );
  }

        Widget _buildSteps() {
    final tr = LanguageProvider.t(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          tr.text('recipe_steps'),

          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 12),

        ...() {
          final list = tr.locale == 'en'
              ? widget.recipe.stepsEn
              : widget.recipe.stepsVi;
          return List.generate(list.length, (index) {
            return _buildStepItem(
              stepNumber: index + 1,
              content: list[index],
            );
          });
        }(),
      ],
    );
  }

        Widget _buildStepItem({required int stepNumber, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 22,
            height: 22,

            decoration: const BoxDecoration(
              color: Color(0xff4CAF50),
              shape: BoxShape.circle,
            ),

            alignment: Alignment.center,

            child: Text(
              '$stepNumber',

              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),

              child: Text(
                content,

                style: const TextStyle(
                  fontSize: 11,
                  height: 1.4,
                  color: Color(0xff657067),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

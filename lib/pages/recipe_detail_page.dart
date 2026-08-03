import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

// ============================================================
// BUILD
// ============================================================
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

                    //_buildIngredients(),
                    const SizedBox(height: 24),

                    //Step of Cooking
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Top Image
  // ============================================================
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

          // Nút quay lại
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

          // Nút yêu thích
          Positioned(
            top: 12,
            right: 12,

            child: GestureDetector(
              onTap: () {
                // Xử lý favorite recipe sau
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

  // ============================================================
  // Recipe Info
  // ============================================================
  Widget _buildRecipeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          widget.recipe.name,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            // widget các infor items
          ],
        ),
      ],
    );
  }
}

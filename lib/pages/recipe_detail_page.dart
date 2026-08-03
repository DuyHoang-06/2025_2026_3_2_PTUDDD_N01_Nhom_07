import 'package:flutter/material.dart';
import '../models/recipe.dart';

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
            //Top Image
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    //Recipe Info
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
}

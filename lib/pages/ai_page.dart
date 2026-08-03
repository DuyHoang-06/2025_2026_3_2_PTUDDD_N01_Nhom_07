import 'package:flutter/material.dart';
import '../data/fake_recipe.dart';
import '../models/recipe.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  String _selectedCategory = 'Tất cả';

  final List<String> _categories = [
    'Tất cả',
    'Nấu nhanh',
    'Lành mạnh',
    'Món Hàn',
  ];

  // ============================================================
  // Tạp getter cho recipes đã lọc theo danh mục
  // ============================================================
  List<Recipe> get _filteredRecipes {
    if (_selectedCategory == 'Tất cả') {
      return fakeRecipes;
    }

    return fakeRecipes.where((recipe) {
      return recipe.category == _selectedCategory;
    }).toList();
  }

  // ============================================================
  // BUILD
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAF6),

      body: SafeArea(
        child: Column(
          children: [_buildHeader(), _buildSearchBar(), _buildCategoryFilter()],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          'Thư Viện Công Thức',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SEARCH BAR
  // ============================================================
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        height: 38,

        decoration: BoxDecoration(
          color: const Color(0xffEAF3EC),
          borderRadius: BorderRadius.circular(20),
        ),

        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Tìm kiếm công thức...',
            hintStyle: TextStyle(fontSize: 10, color: Colors.grey),

            prefixIcon: Icon(Icons.search, size: 16, color: Colors.grey),

            border: InputBorder.none,

            contentPadding: EdgeInsets.symmetric(vertical: 5),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORY FILTER
  // ============================================================
  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 38,

      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        scrollDirection: Axis.horizontal,

        itemCount: _categories.length,

        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },

        itemBuilder: (context, index) {
          final category = _categories[index];

          final selected = category == _selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

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
                category,

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
}

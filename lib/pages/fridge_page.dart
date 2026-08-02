import 'package:flutter/material.dart';
import '../data/fake_food.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController _searchController = TextEditingController();
  // Danh mục hiện tại
  String _selectedCategory = 'Tất cả';

  // ============================================================
  // CATEGORY
  // ============================================================

  List<String> get categories {
    final List<String> result = ['Tất cả'];

    for (final food in fakeFoods) {
      if (!result.contains(food.category)) {
        result.add(food.category);
      }
    }

    return result;
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF6),

      appBar: _buildAppBar(),

      body: Column(
        children: [
          const SizedBox(height: 10),

          _buildSearch(),

          const SizedBox(height: 10),

          _buildCategoryFilter(),
        ],
      ),
    );
  }

  // ============================================================
  // APP BAR
  // ============================================================

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffF7FAF6),

      elevation: 0,

      centerTitle: false,

      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Tủ lạnh của tôi',

            style: TextStyle(
              color: Color(0xff19351F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 2),

          Text(
            'Quản lý thực phẩm của bạn',

            style: TextStyle(color: Color(0xff7C897F), fontSize: 11),
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {},

          icon: const Icon(Icons.add_circle_outline, color: Color(0xff4CAF50)),
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        height: 45,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(color: const Color(0xffE2EAE3)),
        ),

        child: TextField(
          controller: _searchController,
          onChanged: (_) {
            setState(() {});
          },

          decoration: InputDecoration(
            hintText: 'Tìm kiếm thực phẩm...',

            hintStyle: const TextStyle(color: Color(0xff9AA49C), fontSize: 12),

            prefixIcon: const Icon(
              Icons.search,
              size: 20,
              color: Color(0xff7C8C80),
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();

                      setState(() {});
                    },

                    icon: const Icon(Icons.close, size: 18),
                  )
                : null,

            border: InputBorder.none,

            contentPadding: const EdgeInsets.symmetric(vertical: 13),
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

        itemCount: categories.length,

        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },

        itemBuilder: (context, index) {
          final category = categories[index];

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

import 'package:flutter/material.dart';
import '../data/fake_food.dart';
import '../models/food.dart';
import '../widgets/language_provider.dart';
import 'fridge_page.dart';
import 'ai_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    FridgePage(),
    AiPage(),
    ProfilePage(),
  ];

  List<Food> get foods => fakeFoods;

  int get totalFoods => foods.length;

  int get expiringFoods {
    final today = DateTime.now();

    return foods.where((food) {
      final difference = food.expiryDate.difference(today).inDays;

      return difference >= 0 && difference <= 3;
    }).length;
  }

  int get expiredFoods {
    final today = DateTime.now();

    return foods.where((food) {
      return food.expiryDate.isBefore(today);
    }).length;
  }

  List<Map<String, dynamic>> get categories {
    final Map<String, int> categoryKeyCounts = {};

    for (var food in foods) {
      categoryKeyCounts[food.categoryKey] =
          (categoryKeyCounts[food.categoryKey] ?? 0) + 1;
    }

    return categoryKeyCounts.entries.map((entry) {
      return {
        'key': entry.key,
        'count': entry.value,
      };
    }).toList();
  }

  String _getCategoryImage(String categoryKey) {
    switch (categoryKey) {
      case 'category_vegetable':
        return 'assets/imgs/categories/vegetable.png';
      case 'category_meat':
        return 'assets/imgs/categories/meat.png';
      case 'category_drink':
        return 'assets/imgs/categories/drink.jpg';
      case 'category_milk':
        return 'assets/imgs/categories/whitemilk.png';
      case 'category_fruit':
        return 'assets/imgs/categories/fruit.png';
      default:
        return 'assets/imgs/categories/other.png';
    }
  }

  Color _getCategoryColor(String categoryKey) {
    switch (categoryKey) {
      case 'category_vegetable':
        return const Color(0xffE7F6E9);
      case 'category_meat':
        return const Color(0xffffeeee);
      case 'category_drink':
        return const Color(0xfffff3dd);
      case 'category_milk':
        return const Color(0xffE4F4E7);
      case 'category_fruit':
        return const Color(0xffffe8ed);
      default:
        return const Color(0xffE7F6E9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7FAF6),
      child: SafeArea(child: _buildHomeBody()),
    );
  }

  Widget _buildHomeBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),

            _buildHeader(),

            const SizedBox(height: 16),

            _buildSearchBar(),

            const SizedBox(height: 20),

            _buildFridgeBanner(),

            const SizedBox(height: 20),

            const SizedBox(height: 20),

            _buildStatistics(),

            const SizedBox(height: 20),

            _buildCategoryHeader(),

            const SizedBox(height: 20),

            _buildCategories(),

            const SizedBox(height: 20),

            _buildAiHeader(),

            const SizedBox(height: 20),

            _buildFoodSuggestion(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffE9F7EC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.kitchen, color: Color(0xff4CAF50), size: 23),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            'Smart Fridge',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff19351F),
            ),
          ),
        ),

        _buildLanguageToggle(),

        const SizedBox(width: 8),

        Stack(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Color(0xff233328),
                size: 22,
              ),
            ),

            Positioned(
              right: 7,
              top: 6,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 8),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xff4CAF50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'HD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Nút toggle ngôn ngữ EN ↔ VI. Hiển thị locale hiện tại làm nhãn.
  Widget _buildLanguageToggle() {
    final provider = LanguageProvider.of(context);
    final isVi = provider?.locale == 'vi';
    return GestureDetector(
      onTap: () => provider?.toggle(),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffE8EEE9)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, color: Color(0xff4CAF50), size: 16),
            const SizedBox(width: 4),
            Text(
              isVi ? 'VI' : 'EN',
              style: const TextStyle(
                color: Color(0xff233328),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final tr = LanguageProvider.t(context);
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xffEDF5EE),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: tr.text('home_search_hint'),
          hintStyle: const TextStyle(color: Color(0xff87968B), fontSize: 12),
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
            color: Color(0xff7D9181),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildFridgeBanner() {
    final tr = LanguageProvider.t(context);
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: const Color(0xff398A46),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr.text('home_greeting'),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              tr.text('home_user_name'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            Row(
              children: [
                _buildBannerNumber(
                  totalFoods.toString(),
                  tr.text('home_total'),
                ),
                _buildBannerNumber(
                  expiringFoods.toString(),
                  tr.text('home_expiring'),
                ),
                _buildBannerNumber(
                  expiredFoods.toString(),
                  tr.text('home_expired'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerNumber(String number, String title) {
    return Expanded(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 8),
              ),
            ],
          ),

          const SizedBox(width: 15),

          if (title != 'Hết hạn' && title != 'Expired')
            Container(width: 1, height: 30, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    final tr = LanguageProvider.t(context);
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.inventory_2_outlined,
            number: totalFoods.toString(),
            title: tr.text('home_total_foods'),
            color: const Color(0xffE4F4E7),
            iconColor: const Color(0xff4CAF50),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _buildStatCard(
            icon: Icons.warning_amber_rounded,
            number: expiringFoods.toString(),
            title: tr.text('home_soon_expired'),
            color: const Color(0xfffff6df),
            iconColor: const Color(0xffff9d00),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _buildStatCard(
            icon: Icons.close,
            number: expiredFoods.toString(),
            title: tr.text('home_already_expired'),
            color: const Color(0xffffeeee),
            iconColor: const Color(0xffff5252),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String number,
    required String title,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: iconColor),

          const SizedBox(height: 4),

          Text(
            number,
            style: TextStyle(
              color: iconColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xff657067), fontSize: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader() {
    final tr = LanguageProvider.t(context);
    return Row(
      children: [
        Text(
          tr.text('home_categories'),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FridgePage()),
            );
          },
          child: Text(
            tr.text('home_see_all'),
            style: const TextStyle(
              color: Color(0xff4CAF50),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    final tr = LanguageProvider.t(context);
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final key = cat['key'] as String;
          final count = cat['count'] as int;

          return _buildCategoryCard(
            name: tr.text(key),
            image: _getCategoryImage(key),
            color: _getCategoryColor(key),
            count: count,
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard({
    required String name,
    required String image,
    required Color color,
    required int count,
  }) {
    final tr = LanguageProvider.t(context);
    return GestureDetector(
      onTap: () {
        print('Chọn danh mục: $name');
      },
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffE8EEE9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Image.asset(
                image,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 2),

            Text(
              '$count ${tr.text('items_count')}',
              style: const TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAiHeader() {
    final tr = LanguageProvider.t(context);
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: const Color(0xffE7F5E9),
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Icon(
            Icons.auto_awesome,
            color: Color(0xff4CAF50),
            size: 15,
          ),
        ),

        const SizedBox(width: 7),

        Text(
          tr.text('home_ai_today'),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AiPage()),
            );
          },
          child: Text(
            tr.text('home_ai_more'),
            style: const TextStyle(
              color: Color(0xff4CAF50),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodSuggestion() {
    final tr = LanguageProvider.t(context);
    Food? food;

    final today = DateTime.now();

    for (var item in foods) {
      final difference = item.expiryDate.difference(today).inDays;

      if (difference >= 0 && difference <= 3) {
        food = item;
        break;
      }
    }

    return GestureDetector(
      onTap: () {
        print('Mở gợi ý AI');
      },
      child: Container(
        height: 185,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xffE8EEE9)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color(0xffDCEBD8),
                    child: const Icon(
                      Icons.restaurant,
                      size: 60,
                      color: Color(0xff79A878),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff4CAF50),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                            size: 11,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tr.text('home_ai_badge'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
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

            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                food != null
                    ? '${tr.text('home_suggestion_with')} ${tr.text(food.nameKey)}'
                    : tr.text('home_suggestion_empty'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

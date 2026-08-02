import 'package:flutter/material.dart';

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

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF6),

      appBar: _buildAppBar(),

      body: Column(children: [const SizedBox(height: 10), _buildSearch()]),
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
}

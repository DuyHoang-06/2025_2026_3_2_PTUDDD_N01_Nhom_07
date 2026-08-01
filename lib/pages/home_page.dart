import 'package:flutter/material.dart';

import '../data/fake_food.dart';
import '../models/food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF6),
      body: SafeArea(child: _buildHomeBody()),
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

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

        Container(
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
      ],
    );
  }
}

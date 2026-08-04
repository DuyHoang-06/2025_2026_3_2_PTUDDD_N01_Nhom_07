import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAF6),

      appBar: AppBar(
        backgroundColor: const Color(0xffF5FAF6),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Color(0xff1D3022),
          ),
        ),

        title: const Text(
          'About Us',
          style: TextStyle(
            color: Color(0xff1D3022),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            _buildLogo(),

            const SizedBox(height: 20),

            _buildIntroduction(),

            const SizedBox(height: 30),

            const Text(
              'Smart Fridge',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 4),

            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================
  // LOGO
  // ============================================

  Widget _buildLogo() {
    return Container(
      width: 90,
      height: 90,

      decoration: BoxDecoration(
        color: const Color(0xffE4F3E6),
        borderRadius: BorderRadius.circular(25),
      ),

      child: const Icon(Icons.kitchen, size: 50, color: Color(0xff4CAF50)),
    );
  }

  // ============================================
  // GIỚI THIỆU
  // ============================================

  Widget _buildIntroduction() {
    return Column(
      children: [
        const Text(
          'Smart Fridge',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          'Manage your smart fridge',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),

        const SizedBox(height: 16),

        const Text(
          'Smart Fridge helps you manage food '
          'in your smart fridge, track expiration dates and '
          'suggest delicious recipes based on available ingredients.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, height: 1.5, color: Color(0xff657067)),
        ),
      ],
    );
  }
}

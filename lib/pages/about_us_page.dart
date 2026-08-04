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

            _buildContactSection(),

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

  // ============================================
  // DEVELOPMENT TEAM
  // ============================================

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Development Team',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          'Meet the people behind Smart Fridge',
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),

        const SizedBox(height: 14),

        _buildContactItem(
          name: 'Đoàn Duy Hoàng',
          studentId: '24100308',
          role: 'Flutter Developer',
          email: '24100308@st.phenikaa-uni.edu.vn',
          university: 'Phenikaa University',
        ),

        const SizedBox(height: 12),

        _buildContactItem(
          name: 'Đào Duy Khánh',
          studentId: '24108550',
          role: 'UI/UX Designer',
          email: '24108550@st.phenikaa-uni.edu.vn',
          university: 'Phenikaa University',
        ),
      ],
    );
  }

  // ============================================
  // DEVELOPER PROFILE
  // ============================================

  Widget _buildContactItem({
    required String name,
    required String studentId,
    required String role,
    required String email,
    required String university,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE8EEE9)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: const Color(0xffEAF6EC),
              borderRadius: BorderRadius.circular(13),
            ),

            child: const Icon(
              Icons.person_outline,
              size: 24,
              color: Color(0xff4CAF50),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D3022),
                  ),
                ),

                const SizedBox(height: 3),

                // Vai trò
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff4CAF50),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 9),

                // Mã sinh viên
                Row(
                  children: [
                    const Icon(
                      Icons.badge_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        'ID: $studentId',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff657067),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Email
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        email,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff657067),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Trường đại học
                Row(
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        university,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff657067),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

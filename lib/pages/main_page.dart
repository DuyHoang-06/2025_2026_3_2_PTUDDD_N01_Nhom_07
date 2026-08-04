import 'package:flutter/material.dart';

import '../widgets/language_provider.dart';
import 'home_page.dart';
import 'fridge_page.dart';
import 'ai_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FridgePage(),
    AiPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final tr = LanguageProvider.t(context);
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: tr.text('tab_home'),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.kitchen_outlined),
            activeIcon: const Icon(Icons.kitchen),
            label: tr.text('tab_fridge'),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.auto_awesome_outlined),
            activeIcon: const Icon(Icons.auto_awesome),
            label: tr.text('Ăn Ngon'),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: tr.text('tab_profile'),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/language_provider.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    scale = Tween(
      begin: .6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget bubble(double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.06),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = LanguageProvider.t(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          bubble(40, 30, 80),

          bubble(70, 55, 150),

          bubble(150, 220, 280),

          bubble(80, 30, 470),

          bubble(100, 250, 600),

          Center(
            child: ScaleTransition(
              scale: scale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.kitchen,
                      color: Colors.green,
                      size: 55,
                    ),
                  ),

                  const SizedBox(height: 28),

                  Text(
                    tr.text('app_name'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    tr.text('splash_tagline'),
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const SizedBox(height: 80),

                  Text(
                    tr.text('splash_continue'),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

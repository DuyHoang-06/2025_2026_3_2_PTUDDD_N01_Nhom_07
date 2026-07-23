import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

class SmartFridgeApp extends StatelessWidget {
  const SmartFridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Fridge",
      theme: ThemeData(useMaterial3: true, fontFamily: "Roboto"),
      home: const SplashPage(),
    );
  }
}

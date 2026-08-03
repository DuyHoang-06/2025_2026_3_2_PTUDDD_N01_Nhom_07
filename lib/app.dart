import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'services/auth_session.dart';
import 'widgets/language_provider.dart';

class SmartFridgeApp extends StatelessWidget {
  const SmartFridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageScope(
      notifier: LanguageProvider.instance,
      child: AuthSessionScope(
        notifier: AuthSession.instance,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Smart Fridge",
          theme: ThemeData(useMaterial3: true, fontFamily: "Roboto"),
          home: const SplashPage(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Fridge Page',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

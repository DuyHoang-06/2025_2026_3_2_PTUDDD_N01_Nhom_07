import 'package:flutter/material.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAF6),

      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            //_buildSearchBar(),

            //_buildCategoryFilter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          'Thư Viện Công Thức',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3022),
          ),
        ),
      ),
    );
  }
}

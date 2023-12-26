import 'package:flutter/material.dart';

class HomeRecipeScreen extends StatelessWidget {
  const HomeRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: const Center(
        child: Text('HomeScreen is working'),
      ),
    );
  }
}

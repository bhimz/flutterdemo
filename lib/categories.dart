import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a category'),
      ),
      body:  GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            Text("1", style: TextStyle(color: Colors.white)),
            Text("2", style: TextStyle(color: Colors.white)),
            Text("3", style: TextStyle(color: Colors.white)),
            Text("4", style: TextStyle(color: Colors.white)),
          ],
        ),
    );
  }
}
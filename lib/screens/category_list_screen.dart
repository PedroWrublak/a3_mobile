import 'package:flutter/material.dart';
import 'category_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  final categories = const ['Pessoal', 'Trabalho', 'Estudo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text('Escolha uma Categoria'),
        backgroundColor: Color(0xFFFFE082),
      ),
      body: ListView( 
        children: categories.map((cat) {
          return Card(
            color: const Color(0xFFECE3C0),
            child: ListTile(
              title: Text(cat),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryScreen(category: cat),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

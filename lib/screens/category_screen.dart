import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_item.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    final tasks = controller.getTasksByCategory(category);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: Text(
          'Categoria: $category',
          style: const TextStyle(
            color: Color(0xFF6D4C41),
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive',
          ),
        ),
        backgroundColor: const Color(0xFFFFE082),
        iconTheme: const IconThemeData(color: Color(0xFF6D4C41)),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'Nenhuma tarefa em "$category"',
                style: const TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, i) => TaskItem(task: tasks[i]),
            ),
    );
  }
}

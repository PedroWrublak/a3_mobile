import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final bool showCompleteButton;

  const TaskItem({super.key, required this.task, this.showCompleteButton = true});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCompleteButton)
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () => controller.markAsCompleted(task.id),
              ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => controller.excluir(task.id),
            ),
          ],
        ),
      ),
    );
  }
}

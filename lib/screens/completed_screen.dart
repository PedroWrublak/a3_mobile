import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_item.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text(
          'Tarefas Concluídas',
          style: TextStyle(
            color: Color(0xFF6D4C41),
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE082),
        elevation: 3,
        iconTheme: const IconThemeData(color: Color(0xFF6D4C41)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFFE082)),
              child: Text(
                'To Do App',
                style: TextStyle(color: Color(0xFF6D4C41), fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () => Navigator.pushReplacementNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categorias'),
              onTap: () => Navigator.pushNamed(context, '/categories'),
            ),
          ],
        ),
      ),
      body: controller.completedTasks.isEmpty
          ? const Center(child: Text('Nenhuma tarefa concluída.'))
          : ListView.builder(
              itemCount: controller.completedTasks.length,
              itemBuilder: (ctx, i) {
                final task = controller.completedTasks[i];
                return TaskItem(task: task, showCompleteButton: false);
              },
            ),
    );
  }
}

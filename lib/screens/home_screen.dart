import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text(
          'Bloco de Notas',
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
                'To do App',
                style: TextStyle(color: Color(0xFF6D4C41), fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.done),
              title: const Text('Completed'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/completed'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
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
      body: controller.activeTasks.isEmpty
          ? const Center(child: Text('Nenhuma tarefa ativa.'))
          : ListView.builder(
              itemCount: controller.activeTasks.length,
              itemBuilder: (ctx, i) {
                final task = controller.activeTasks[i];
                return TaskItem(task: task);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFE082),
        onPressed: () => Navigator.pushNamed(context, '/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

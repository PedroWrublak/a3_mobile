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
      appBar: AppBar(title: const Text('Tarefas Ativas')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Organiza+', style: TextStyle(color: Colors.white, fontSize: 22)),
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
        onPressed: () => Navigator.pushNamed(context, '/new'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text('Organiza+', style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/new'),
          ),
          ListTile(
            leading: const Icon(Icons.done),
            title: const Text('Completed'),
            onTap: () => Navigator.pushReplacementNamed(context, '/completed'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}

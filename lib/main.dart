import 'package:a3_mobile/screens/category_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/task_controller.dart';
import 'screens/home_screen.dart';
import 'screens/new_task_screen.dart';
import 'screens/completed_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To do App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/new': (context) => const NewTaskScreen(),
          '/completed': (context) => const CompletedScreen(),
          '/about': (context) => const AboutScreen(),
          '/categories': (context) => const CategoryListScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get activeTasks =>
      _tasks.where((t) => !t.completed).toList();

  List<Task> get completedTasks =>
      _tasks.where((t) => t.completed).toList();

  void adicionar(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void atualizar(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }

  void excluir(int id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void markAsCompleted(int id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.completed = true;
    notifyListeners();
  }
}

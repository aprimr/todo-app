import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  // Ponstructor
  TaskProvider() {
    _loadTasks();
  }

  List<String> _tasks = [];

  // Add Task
  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
    _saveTasks();
  }

  //  Persist tasks
  void _loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks = prefs.getStringList('tasks') ?? [];
    notifyListeners();
  }

  void _saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', _tasks);
  }
}

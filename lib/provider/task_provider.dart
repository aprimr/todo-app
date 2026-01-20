import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  // Ponstructor
  TaskProvider() {
    _loadTasks();
  }

  List<String> _tasks = [];
  List<String> _completed = [];

  // Add Task
  void addTask(String task) {
    _tasks.add(task);
    _completed.add("false");
    notifyListeners();
    _saveTasks();
  }

  // Fetch All Tasks
  (List<String>, List<String>) fetchAllTasks() {
    return (_tasks, _completed);
  }

  void deleteTaskByID(int index) {
    _tasks.removeAt(index);
    _completed.removeAt(index);
    notifyListeners();
    _saveTasks();
  }

  // Toggle Task completed
  void toggleCompleted(int index) {
    _completed[index] = _completed[index] == "false" ? "true" : "false";
    _saveTasks();
    notifyListeners();
  }

  // Delete All Tasks
  void deleteAllTasks() {
    _tasks.clear();
    _completed.clear();
    notifyListeners();
    _saveTasks();
  }

  //  Persist tasks
  void _loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks = prefs.getStringList('tasks') ?? [];
    _completed = prefs.getStringList('completed') ?? [];
    notifyListeners();
  }

  void _saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', _tasks);
    await prefs.setStringList('completed', _completed);
  }
}

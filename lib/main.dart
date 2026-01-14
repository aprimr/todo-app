import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = "Todo App";
    return MaterialApp(
      title: title,
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Home(title: title),
    );
  }
}

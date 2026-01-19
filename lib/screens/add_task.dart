import 'package:flutter/material.dart';
import 'package:todo_app/widgets/appbar_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppbarWidget(title: "Add Tasks"));
  }
}

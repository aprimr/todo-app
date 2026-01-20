import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/appbar_widget.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int taskId = args['taskId'];
    final (task, completed) = context.watch<TaskProvider>().fetchTaskById(
      taskId,
    );
    return Scaffold(
      appBar: AppbarWidget(title: ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 28,
                  right: 28,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Badge(isCompleted: completed, index: taskId),
                    Text(
                      task.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    EditTaskButton(),
                  ],
                ),
              ),
            ),
          ),
          BannerAdsWidget(),
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final String isCompleted;
  final int index;
  const Badge({super.key, required this.isCompleted, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TaskProvider>().toggleCompleted(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isCompleted == "false"
              ? Theme.of(context).colorScheme.errorContainer
              : Theme.of(context).colorScheme.surfaceTint,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          isCompleted == "false" ? "NOT COMPLETED" : "COMPLETED",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isCompleted == "false"
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.outline,
            fontFamily: GoogleFonts.mukta().fontFamily,
          ),
        ),
      ),
    );
  }
}

class EditTaskButton extends StatelessWidget {
  const EditTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            child: Text(
              "Edit Task",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/utils/routes.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});
  @override
  Widget build(context) {
    final taskProvider = context.watch<TaskProvider>();
    final (tasks, completed) = taskProvider.fetchAllTasks();
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
        child: tasks.isNotEmpty
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<TaskProvider>().deleteTaskByID(index);
                    },
                    background: Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedDelete02,
                            size: 26,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.taskDetailRoute,
                          arguments: {'taskId': index},
                        );
                      },
                      child: Card(
                        elevation: 0.5,
                        color: completed[index] == "false"
                            ? Theme.of(context).colorScheme.errorContainer
                            : Theme.of(context).colorScheme.surfaceTint,
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {
                              taskProvider.toggleCompleted(index);
                            },
                            icon: HugeIcon(
                              icon: completed[index] == "false"
                                  ? HugeIcons.strokeRoundedTaskRemove02
                                  : HugeIcons.strokeRoundedTaskDone02,
                              color: completed[index] == "false"
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          title: Text(
                            tasks[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Column(
                children: [
                  SizedBox(height: 80),
                  HugeIcon(
                    size: 80,
                    strokeWidth: 0.9,
                    color: Theme.of(context).colorScheme.tertiary,
                    icon: HugeIcons.strokeRoundedLicenseNo,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "No tasks added",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  SizedBox(height: 100),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HugeIcon(
                            size: 18,
                            strokeWidth: 2.5,
                            color: Theme.of(context).colorScheme.tertiary,
                            icon: HugeIcons.strokeRoundedInformationCircle,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Tip",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Swipe tasks to left to delete tasks. ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: GoogleFonts.lexend().fontFamily,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

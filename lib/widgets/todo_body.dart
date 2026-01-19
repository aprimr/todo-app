import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({super.key});
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
                    onDismissed: (direction) {},
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
                    child: Card(
                      elevation: 0.5,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      child: ListTile(
                        leading: HugeIcon(
                          icon: completed[index] == "true"
                              ? HugeIcons.strokeRoundedTaskDone02
                              : HugeIcons.strokeRoundedTaskRemove02,
                          color: completed[index] == "true"
                              ? Theme.of(context).colorScheme.outline
                              : Theme.of(context).colorScheme.error,
                        ),
                        title: Text(
                          tasks[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Theme.of(context).colorScheme.secondary,
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
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/snackbar.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/appbar_widget.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  String task = '';
  late TaskProvider taskProvider;

  @override
  void initState() {
    super.initState();
    taskProvider = context.read<TaskProvider>();
  }

  // On Add Task
  void submitForm() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      taskProvider.addTask(task);
      _formKey.currentState!.reset();
      showSnackBar(context, message: "Task added");
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Add Task",
        actionIcon: HugeIcon(
          icon: HugeIcons.strokeRoundedDelete03,
          color: Theme.of(context).colorScheme.error,
        ),
        actionFunction: () {
          taskProvider.deleteAllTasks();
          showSnackBar(context, message: "Deleted All Tasks");
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 28,
                right: 28,
                bottom: 8,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: ValueKey("task"),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "A task is expected";
                        } else if (value.toString().length > 500) {
                          return "Task too long";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        task = newValue.toString();
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      decoration: InputDecoration(
                        label: Text(
                          "Enter a task",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        errorStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2.5,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                      autocorrect: false,
                      enableSuggestions: false,
                      minLines: 3,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 30),
                    FilledButton(
                      onPressed: () {
                        submitForm();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                size: 22,
                                strokeWidth: 2,
                                icon: HugeIcons.strokeRoundedTaskAdd02,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Add Task",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/snackbar.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/appbar_widget.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();
  String task = '';
  late TaskProvider taskProvider;

  @override
  void initState() {
    super.initState();
    taskProvider = context.read<TaskProvider>();
  }

  void submitForm(int index) {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      taskProvider.modifyTask(index, task);
      _formKey.currentState!.reset();
      Navigator.pop(context);
      showSnackBar(context, message: "Task modified");
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int taskId = args['taskId'];
    final String taskStr = args['task'];
    task = taskStr;

    return Scaffold(
      appBar: AppbarWidget(
        title: "Edit Task",
        actionIcon: HugeIcon(
          size: 30,
          strokeWidth: 2,
          icon: HugeIcons.strokeRoundedTick02,
          color: Theme.of(context).colorScheme.outline,
        ),
        actionFunction: () {
          submitForm(taskId);
        },
      ),
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
                        initialValue: taskStr,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            "Edit task",
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
                    ],
                  ),
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

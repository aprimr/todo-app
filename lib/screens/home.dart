import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/theme/theme_provider.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    void addTask(String value) {
      setState(() {
        tasks.add(value);
      });
      print(tasks);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Header(title: widget.title),
            TodoBody(tasks: tasks),
            AddTodo(addTask: addTask),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, right: 30, top: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleTheme();
                },
                icon: HugeIcon(
                  icon: Theme.of(context).brightness == Brightness.dark
                      ? HugeIcons.strokeRoundedSun03
                      : HugeIcons.strokeRoundedMoon02,
                  color: Theme.of(context).colorScheme.secondary,
                  strokeWidth: 2,
                ),
              ),
              HugeIcon(
                size: 32,
                strokeWidth: 2,
                icon: HugeIcons.strokeRoundedNote,
                color: Theme.of(context).colorScheme.primary,
              ),
              IconButton(
                onPressed: () {},
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: Theme.of(context).colorScheme.secondary,
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              fontFamily: GoogleFonts.outfit().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class TodoBody extends StatelessWidget {
  final List<String> tasks;
  const TodoBody({super.key, required this.tasks});
  @override
  Widget build(context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0.5,
              color: Theme.of(context).colorScheme.inversePrimary,
              child: ListTile(
                leading: HugeIcon(
                  icon: HugeIcons.strokeRoundedNote01,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  tasks[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddTodo extends StatefulWidget {
  final Function addTask;
  const AddTodo({super.key, required this.addTask});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _taskInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: TextField(
              controller: _taskInputController,
              decoration: InputDecoration(
                hint: Text(
                  "Enter a task",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    widget.addTask(_taskInputController.text.trim());
                    _taskInputController.text = "";
                  },
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedNoteAdd,
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

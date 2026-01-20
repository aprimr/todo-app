import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/snackbar.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/theme/theme_provider.dart';
import 'package:todo_app/utils/routes.dart';
import 'package:todo_app/widgets/appbar_widget.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';
import 'package:todo_app/widgets/ui/version.dart';

class Setting extends StatelessWidget {
  final String appName;
  const Setting({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.read<TaskProvider>();
    final themeProvider = context.read<ThemeProvider>();
    return Scaffold(
      appBar: AppbarWidget(title: "Settings"),
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
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiaryContainer,
                          child: ListTile(
                            onTap: () {
                              themeProvider.toggleTheme();
                            },
                            leading: HugeIcon(
                              icon:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? HugeIcons.strokeRoundedSun03
                                  : HugeIcons.strokeRoundedMoon02,
                              color: Theme.of(context).colorScheme.secondary,
                              strokeWidth: 2,
                            ),
                            title: Text(
                              "Toggle Theme",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.errorContainer,
                          child: ListTile(
                            onTap: () {
                              taskProvider.deleteAllTasks();
                              showSnackBar(
                                context,
                                message: "Deleted All Tasks",
                              );
                            },
                            leading: HugeIcon(
                              color: Theme.of(context).colorScheme.error,
                              icon: HugeIcons.strokeRoundedDelete02,
                            ),
                            title: Text(
                              "Delete All Tasks",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.error,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiaryContainer,
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.aboutRoute,
                              );
                            },
                            leading: HugeIcon(
                              icon: HugeIcons.strokeRoundedNote,
                              color: Theme.of(context).colorScheme.secondary,
                              strokeWidth: 1.5,
                            ),
                            title: Text(
                              "About Taskzz",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HugeIcon(
                              size: 32,
                              strokeWidth: 2,
                              icon: HugeIcons.strokeRoundedNote,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(width: 10),
                            Text(
                              appName,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Version(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BannerAdsWidget(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:todo_app/widgets/appbar_widget.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';
import 'package:todo_app/widgets/ui/version.dart';

class About extends StatelessWidget {
  final String appName;
  const About({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppbarWidget(title: "About $appName"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 28,
                  right: 28,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HugeIcon(
                          size: 32,
                          strokeWidth: 2,
                          icon: HugeIcons.strokeRoundedNote,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 6),
                        Text(
                          appName,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Version(),
                    const SizedBox(height: 24),
                    Divider(color: theme.colorScheme.tertiary, thickness: 1),
                    const SizedBox(height: 20),
                    Text(
                      "About $appName",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "$appName is a simple and minimal task management application designed to help you stay productive without distractions.\n\n"
                      "With $appName, you can easily create, read, update, and delete tasks, allowing you to manage your daily goals efficiently."
                      "The app focuses on clarity, speed, and ease of use — making task management feel natural and lightweight.\n\n"
                      "$appName embraces minimalism by offering only essential features such as task completion toggles and theme switching, so you can focus on what matters most: getting things done.",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.6,
                        letterSpacing: 0.4,
                        fontFamily: GoogleFonts.onest().fontFamily,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text(
                      "Features",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _featureItem("Create, edit, and delete tasks"),
                    _featureItem("Mark tasks as completed"),
                    _featureItem("Light & dark theme toggle"),
                    _featureItem("Clean, minimal user interface"),
                    _featureItem("Focused on productivity"),
                    const SizedBox(height: 32),
                    Divider(color: theme.colorScheme.tertiary, thickness: 1),
                    const SizedBox(height: 20),
                    Text(
                      "How to Use $appName",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _howToItem(
                      "Open the app to view all your tasks on the home screen.",
                    ),
                    _howToItem("Tap the add button to create a new task."),
                    _howToItem("Tap on a task to view its details."),
                    _howToItem(
                      "Edit or delete a task using the available actions.",
                    ),
                    _howToItem(
                      "Mark tasks as completed by toggling the completion badge.",
                    ),
                    _howToItem(
                      "Switch between light and dark themes from settings.",
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),

          /// Ads
          BannerAdsWidget(),
        ],
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "›  ",
            style: TextStyle(
              fontSize: 22,
              height: 1.5,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontFamily: GoogleFonts.onest().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _howToItem(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "›  ",
          style: TextStyle(
            fontSize: 22,
            height: 1.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontFamily: GoogleFonts.onest().fontFamily,
            ),
          ),
        ),
      ],
    ),
  );
}

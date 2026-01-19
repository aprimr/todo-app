import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/theme/theme_provider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = context.read<ThemeProvider>();

    return IconButton(
      onPressed: () {
        themeData.toggleTheme();
      },
      icon: HugeIcon(
        icon: Theme.of(context).brightness == Brightness.dark
            ? HugeIcons.strokeRoundedSun03
            : HugeIcons.strokeRoundedMoon02,
        color: Theme.of(context).colorScheme.secondary,
        strokeWidth: 2,
      ),
    );
  }
}

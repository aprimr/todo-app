import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionIcon;
  final VoidCallback? actionFunction;
  const AppbarWidget({
    super.key,
    required this.title,
    this.actionIcon,
    this.actionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      actions: [
        if (actionFunction != null && actionIcon != null)
          IconButton(onPressed: actionFunction, icon: actionIcon!),

        SizedBox(width: 14),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

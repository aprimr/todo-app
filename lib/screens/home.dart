import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/theme/theme.dart';
import 'package:todo_app/theme/theme_provider.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(children: [Header(title: title)]),
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
              fontSize: 34,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:todo_app/utils/routes.dart';
import 'package:todo_app/widgets/banner_ads_widget.dart';
import 'package:todo_app/widgets/todo_body.dart';
import 'package:todo_app/widgets/ui/toggle_theme_button.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Header(title: title),
            Expanded(flex: 1, child: TodoBody()),
            BannerAdsWidget(),
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
              ToggleThemeButton(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addTasksRoute);
                },
                icon: HugeIcon(
                  strokeWidth: 2,
                  icon: HugeIcons.strokeRoundedAddSquare,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                size: 32,
                strokeWidth: 2,
                icon: HugeIcons.strokeRoundedNote,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 6),
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
        ],
      ),
    );
  }
}

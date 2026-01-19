import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/theme/theme.dart';
import 'package:todo_app/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the Mobile Ads SDK 
  MobileAds.instance.initialize();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = "Taskzz";
    final themeData = context.watch<ThemeProvider>();

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeData.isDark ? ThemeMode.dark : ThemeMode.light,
      home: Home(title: title),
    );
  }
}

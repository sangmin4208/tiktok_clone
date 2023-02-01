import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: const Color(0xFFE9435A).toMaterialColor(),
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.pink,
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(
              color: Colors.grey,
              size: Sizes.size24,
            ),
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

extension ToMaterialColor on Color {
  MaterialColor toMaterialColor() {
    return MaterialColor(value, {
      50: withOpacity(0.1),
      100: withOpacity(0.2),
      200: withOpacity(0.3),
      300: withOpacity(0.4),
      400: withOpacity(0.5),
      500: withOpacity(0.6),
      600: withOpacity(0.7),
      700: withOpacity(0.8),
      800: withOpacity(0.9),
      900: withOpacity(1),
    });
  }
}

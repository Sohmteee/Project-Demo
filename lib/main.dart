import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:yeerlo/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeerlo',
      theme: isLightTheme
          ? ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: lightOrangeColor,
                primary: Colors.white,
              ),
              useMaterial3: false,
              fontFamily: 'DM Sans',
            )
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: darkOrangeColor,
                primary: Colors.black,
              ),
              useMaterial3: false,
              fontFamily: 'DM Sans',
            ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

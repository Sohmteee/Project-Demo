import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/pages/home_page.dart';
import 'package:flutter/material.dart';

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
              ),
              useMaterial3: false,
              fontFamily: 'DM Sans',
            )
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: darkOrangeColor,
              ),
              useMaterial3: false,
              fontFamily: 'DM Sans',
            ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

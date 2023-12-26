import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/screens/home.dart';
import 'package:yeerlo/screens/onboarding/onboarding.dart';
import 'package:yeerlo/screens/splash.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
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
          routes: {
            '/onboarding': (context) => const OnboardingScreen(),
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}

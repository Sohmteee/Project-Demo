import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:yeerlo/screens/home.dart';
import 'package:yeerlo/screens/onboarding.dart';
import 'package:yeerlo/screens/registration/reset_password.dart';
import 'package:yeerlo/screens/registration/sign_in.dart';
import 'package:yeerlo/screens/registration/sign_up.dart';
import 'package:yeerlo/screens/registration/verification.dart';
import 'package:yeerlo/screens/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Yeerlo',
          theme: themeProvider.themeType == ThemeType.light
              ? ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: lightOrangeColor,
                    primary: Colors.white,
                    secondary: Colors.black,
                  ),
                  useMaterial3: false,
                  fontFamily: 'DM Sans',
                )
              : ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: darkOrangeColor,
                    primary: Colors.black,
                    secondary: Colors.white,
                  ),
                  useMaterial3: false,
                  fontFamily: 'DM Sans',
                ),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding': (context) => const OnboardingScreen(),
            '/home': (context) => const HomeScreen(),
            '/sign-in': (context) => const SignInScreen(),
            '/sign-up': (context) => const SignUpScreen(),
            '/verification': (context) => const VerificationScreen(),
            '/reset-password': (context) => const ResetPasswordScreen(),
          },
        );
      },
    );
  }
}

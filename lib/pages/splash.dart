import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: DecorationImage(
          image: AssetImage('assets/images/backgrounds/splash-bg.png'),
          fit: BoxFit.cover,
        ),
        child: Center(
          child: SizedBox(
            width: 224.w,
            height: 155.h,
            child: Image.asset('assets/images/logos/light-logo.png'),
          ),
        ),
      ),
    );
  }
}

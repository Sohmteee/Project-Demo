import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dark-gradient-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 224.w,
            height: 155.h,
            child: Image.asset('assets/images/logos/light-logo.png'),
          )
              .animate(onPlay: (controller) {
                controller.repeat();
              })
              .shimmer(
                delay: 2.5.seconds,
                color: lightOrangeColor,
                duration: 1.seconds,
              )
              .scaleXY(
                delay: 2.seconds,
                begin: 1,
                end: 1.1,
                duration: 1.seconds,
              )
              .then()
              .scaleXY(
                begin: 1,
                end: .91,
                duration: .5.seconds,
                curve: Curves.bounceOut,
              ),
        ),
      ),
    );
  }
}

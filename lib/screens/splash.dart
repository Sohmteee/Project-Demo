import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/providers/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(5.seconds, () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: (themeProvider.themeType == ThemeType.dark)
                ? const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/dark-gradient-background.png'),
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
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
          if (themeProvider.themeType == ThemeType.light)
            Positioned(
              top: -20.h,
              right: 0,
              child: Image.asset(
                'assets/images/onboarding/blur-1.png',
                width: 227.w,
                height: 209.h,
              ),
            ),
          if (themeProvider.themeType == ThemeType.light)
            Positioned(
              bottom: 0,
              right: -110.w,
              child: Image.asset(
                'assets/images/onboarding/blur-2.png',
                width: 349.w,
                height: 322.h,
              ),
            ),
          if (themeProvider.themeType == ThemeType.light)
            Positioned(
              bottom: 0,
              left: -20.w,
              child: Image.asset(
                'assets/images/onboarding/blur-3.png',
                width: 166.w,
                height: 153.h,
              ),
            ),
        ],
      ),
    );
  }
}

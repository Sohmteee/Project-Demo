import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/data.dart';

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
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (!isLightTheme)
              Positioned(
                top: -710,
                left: -300,
                child: Blur(
                  blur: 10,
                  blurColor: Colors.white.withOpacity(0.1),
                  
                  child: Container(
                    width: MediaQuery.of(context).size.width * 2,
                    height: MediaQuery.of(context).size.width * 2,
                    decoration: const BoxDecoration(
                      color: Vx.gray200,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            SizedBox(
              width: 224.w,
              height: 155.h,
              child: Image.asset('assets/images/logos/light-logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          children: [
            if (!isLightTheme)
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * .5,
                color: Colors.white,
                child: Image.asset('assets/images/logos/dark-logo.png'),
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

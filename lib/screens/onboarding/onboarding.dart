import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';

class OnbaordingScreen extends StatefulWidget {
  const OnbaordingScreen({super.key});

  @override
  State<OnbaordingScreen> createState() => _OnbaordingScreenState();
}

class _OnbaordingScreenState extends State<OnbaordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const Spacer(),
              Image.asset('assets/images/onboarding/onb-1.png'),
              const Spacer(flex: 3),
            ],
          ),
          Container(
            width: double.infinity,
            height: 270.h,
            decoration: BoxDecoration(
              b
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

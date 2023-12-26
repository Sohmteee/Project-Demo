import 'package:flutter/material.dart';

class OnbaordingScreen extends StatefulWidget {
  const OnbaordingScreen({super.key});

  @override
  State<OnbaordingScreen> createState() => _OnbaordingScreenState();
}

class _OnbaordingScreenState extends State<OnbaordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Image.asset('assets/images/onboarding/onb-1.png'),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

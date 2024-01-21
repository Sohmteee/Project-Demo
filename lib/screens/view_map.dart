import 'package:flutter/material.dart';

class ViewMapScreen extends StatefulWidget {
  const ViewMapScreen({super.key});

  @override
  State<ViewMapScreen> createState() => _ViewMapScreenState();
}

class _ViewMapScreenState extends State<ViewMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            width: 262,
            height: 51,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFEEEEEE),),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x7FD3D1D8),
                  blurRadius: 60,
                  offset: Offset(0, 40),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/view-map/map.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

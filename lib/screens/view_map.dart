import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMapScreen extends StatefulWidget {
  const ViewMapScreen({super.key});

  @override
  State<ViewMapScreen> createState() => _ViewMapScreenState();
}

class _ViewMapScreenState extends State<ViewMapScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70.h,
        title: Container(
          width: 262.w,
          height: 51.h,
          margin: EdgeInsets.only(top: 15.h, left: 20.sp),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFFEEEEEE),
              ),
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
        actions: [
          Container(
            margin: EdgeInsets.only(top: 15.h, right: 25.sp),
            padding: EdgeInsets.all(12.sp),
            width: 50.w,
            height: 50.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFEEEEEE),
                ),
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
            child: Image.asset(
              'assets/images/view-map/locate.png',
            ),
          ),
        ],
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

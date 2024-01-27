import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150.h),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 30.h,
                  bottom: 28.h,
                ),
                child: Row(
                  children: [
                    BackButton(color: Theme.of(context).colorScheme.secondary),
                    DMSansText(
                      'Get a Ticket',
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/get-ticket/button-outline.svg',
                          width: 34.w,
                          height: 34.h,
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              darkOrangeColor,
                              lightOrangeColor,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: Icon(
                            Icons.chevron_left,
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 100.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Expanded(
                        child: ListView.separated(
                          itemCount: 30,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 48.w,
                              height: 48.h,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 9.w),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/get-ticket/button-outline.svg',
                          width: 34.w,
                          height: 34.h,
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              darkOrangeColor,
                              lightOrangeColor,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: Icon(
                            Icons.chevron_right,
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(),
    );
  }
}

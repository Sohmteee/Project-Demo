import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int onBoardingIndex = 0;
  List onBoardingData = [
    {
      'image': 'assets/images/onboarding/onb-1.png',
      'title': 'Uncover and Explore Local \nEvents',
      'description':
          'Your gateway to local adventure! \nDiscover exciting happenings right \nin your area',
    },
    {
      'image': 'assets/images/onboarding/onb-2.png',
      'title': 'Spot Engaging Events on \nyour Calendar',
      'description': 'Personalized calendar ensuring you never '
          '\nmiss the perfect event that fits '
          '\nseamlessly into your schedule',
    },
    {
      'image': 'assets/images/onboarding/onb-3.png',
      'title': 'Navigate to Your \nDestination with Ease',
      'description':
          'Your essential map for smooth and \neffortless journey planning',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List pages = List.generate(3, (index) {
      return Column(
        children: [
          const Spacer(),
          Image.asset(onBoardingData[index]['image']).animate().moveY(
                delay: 0.5.seconds,
                begin: 450.h,
                end: 0,
                duration: 500.milliseconds,
                curve: Curves.bounceOut,
              ),
          const Spacer(flex: 2),
        ],
      );
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Container(
            padding: EdgeInsets.all(40.sp),
            width: double.infinity,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
              ),
            ),
            child: Column(
              children: [
                DMSansText(
                  onBoardingData[onBoardingIndex]['title'],
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                DMSansText(
                  onBoardingData[onBoardingIndex]['description'],
                  color: Colors.white,
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                  height: 1.8,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (onBoardingIndex > 0) {
                          setState(() {
                            onBoardingIndex--;
                          });
                          pageController.previousPage(
                            duration: 500.milliseconds,
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        color: Colors.transparent,
                        child: AnimatedOpacity(
                          opacity: (onBoardingIndex == 0) ? 0.5 : 1,
                          duration: 0.25.seconds,
                          child: AirBnBText(
                            'Skip',
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.10.h,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) {
                          return AnimatedContainer(
                            duration: 500.milliseconds,
                            margin: EdgeInsets.only(right: 10.w),
                            width: 8.sp,
                            height: 8.sp,
                            decoration: BoxDecoration(
                              color: (index == onBoardingIndex)
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.50),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (onBoardingIndex < 2) {
                          setState(() {
                            onBoardingIndex++;
                          });
                          pageController.nextPage(
                            duration: 500.milliseconds,
                            curve: Curves.easeIn,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        color: Colors.transparent,
                        child: AirBnBText(
                          'Next',
                          textAlign: TextAlign.right,
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: 0.10.h,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

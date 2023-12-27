import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final imageController = PageController();
  final titleController = PageController();
  final descriptionController = PageController();
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    List images = List.generate(3, (index) {
      return Column(
        children: [
          const Spacer(),
          Image.asset(onBoardingData[index]['image']).animate().moveY(
                delay: 500.milliseconds,
                begin: 450.h,
                end: 0,
                duration: 800.milliseconds,
                curve: Curves.elasticOut,
              ),
          const Spacer(flex: 2),
        ],
      );
    });

    List titles = List.generate(3, (index) {
      return DMSansText(
        onBoardingData[index]['title'],
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      );
    });

    List descriptions = List.generate(3, (index) {
      return DMSansText(
        onBoardingData[index]['description'],
        color: Colors.white,
        fontSize: 15.sp,
        textAlign: TextAlign.center,
        height: 1.8,
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: (themeProvider.themeType == ThemeType.dark)
              ? const DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: imageController,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return images[index];
              },
            ),
            Container(
              padding: EdgeInsets.all(40.sp),
              width: double.infinity,
              height: 250.h,
              decoration: BoxDecoration(
                color: themeProvider.themeType == ThemeType.dark
                    ? darkBackgroundColor
                    : null,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.r),
                ),
                gradient: themeProvider.themeType == ThemeType.light
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                      )
                    : null,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 45.h,
                    child: PageView.builder(
                      controller: titleController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return titles[index];
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 65.h,
                    child: PageView.builder(
                      controller: descriptionController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return descriptions[index];
                      },
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onBoardingIndex > 0) {
                            Navigator.pushReplacementNamed(context, '/sign-in');
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
                            imageController.nextPage(
                              duration: 300.milliseconds,
                              curve: Curves.easeIn,
                            );
                            titleController.nextPage(
                              duration: 300.milliseconds,
                              curve: Curves.easeIn,
                            );
                            descriptionController.nextPage(
                              duration: 300.milliseconds,
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.pushReplacementNamed(context, '/sign-in');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          color: Colors.transparent,
                          child: AirBnBText(
                            onBoardingIndex < 2 ? 'Next' : 'Done',
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
      ),
    );
  }
}

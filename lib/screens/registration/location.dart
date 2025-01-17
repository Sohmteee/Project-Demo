import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/countries.dart';
import 'package:yeerlo/models/flag.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    countryList.sort((a, b) => a['name'].compareTo(b['name']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft,
            color: Theme.of(context).colorScheme.secondary,
            size: 24.sp,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: ZoomTapAnimation(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Container(
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
              ),
            ),
            child: Center(
              child: DMSansText(
                'Select Location',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80.h),
        decoration: (themeProvider.themeType == ThemeType.dark)
            ? const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AirBnBText(
                  'Your Location',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerLeft,
                child: DMSansText(
                  'Please enter your current location',
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: DMSansText(
                  'Country or city',
                  fontSize: 18.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 9.h),
              TypeAheadField(
                hideOnEmpty: true,
                decorationBuilder: (context, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: child,
                  );
                },
                itemBuilder: (context, country) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: AirBnBText(
                      country['name'],
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                },
                builder: (context, controller, focusNode) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: GradientBoxBorder(
                        width: 2,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            focusNode: focusNode,
                            cursorColor: lightOrangeColor,
                            onTapOutside: (event) {
                              controller.clear();
                              FocusScope.of(context).unfocus();
                            },
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 2.h),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: selectedCountry['name'] ==
                                      'United States of America'
                                  ? 'United States'
                                  : selectedCountry['name'],
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.5),
                              ),
                            ),
                          ),
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              lightOrangeColor,
                              darkOrangeColor,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: Icon(
                            IconlyLight.search,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                suggestionsCallback: (pattern) {
                  return countryList
                      .where((country) => country['name']
                          .toLowerCase()
                          .contains(pattern.toLowerCase()))
                      .toList();
                },
                onSelected: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              ),
              SizedBox(height: 17.h),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: themeProvider.themeType == ThemeType.light
                      ? lightBackgroundColor
                      : darkBackgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: (themeProvider.themeType == ThemeType.dark)
                      ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black,
                            darkBackgroundColor,
                          ],
                        )
                      : null,
                  boxShadow: [
                    if (themeProvider.themeType == ThemeType.light)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 30.r,
                        offset: const Offset(0, 10),
                      ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CountriesFlag(
                          getFlagPath(selectedCountry['name']),
                          width: 64.w,
                          height: 64.h,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DMSansText(
                              selectedCountry['name'] ==
                                      'United States of America'
                                  ? 'United States'
                                  : selectedCountry['name'],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            DMSansText(
                              selectedCountry['code']
                                          .toString()
                                          .split('.')
                                          .last ==
                                      'US'
                                  ? 'USA'
                                  : selectedCountry['code']
                                      .toString()
                                      .split('.')
                                      .last,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.done,
                        size: 24.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

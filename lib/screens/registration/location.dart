import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
              SearchAnchor(
                  builder: (context, controller) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: HexColor('#E4DFDF'),
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              cursorColor: darkOrangeColor,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Choose country',
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: linkTextColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 20.h,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            IconlyLight.search,
                            size: 22.sp,
                            color: registrationIconColor,
                          ),
                        ],
                      ),
                    );
                  },
                  suggestionsBuilder: (context, controller){
                    return Container()
                  },),
              AppTextField(
                hintText: 'abc@email.com',
                icon: Icon(
                  IconlyLight.message,
                  size: 22.sp,
                  color: registrationIconColor,
                ),
              ),
              SizedBox(height: 26.h),
              ArrowButton(
                text: 'SEND',
                onPressed: () {
                  Navigator.pushNamed(context, '/verification');
                },
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

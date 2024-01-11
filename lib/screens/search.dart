import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        title: AirBnBText(
          'Search',
          color: HexColor('#120D26'),
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Row(
              children: [
                //search button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: SvgPicture.asset(
                    'assets/svg/search.svg',
                  ),
                ),
        
                //textfield
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Vx.gray300,
                          fontSize: 20.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
        
                //filter button
                ZoomTapAnimation(
                  onTap: () {
                    /*  setState(() {
                isOpenFilter = true;
              });
              panelController.expand(); */
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 5.h, 10.w, 5.h),
                    decoration: BoxDecoration(
                      color: themeProvider.themeType == ThemeType.light
                          ? Colors.white
                          : const Color(0xFF302F2F),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/filter-circle.svg'),
                        SizedBox(width: 5.w),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: themeProvider.themeType == ThemeType.light
                                ? darkOrangeColor
                                : Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

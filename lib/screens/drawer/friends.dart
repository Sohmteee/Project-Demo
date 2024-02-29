import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  int pageIndex = 0;
  List isTicked =
      List.generate(/* friends.length */ 10, (index) => index % 2 == 0);
  final pageController = PageController();

  List<Map<String, dynamic>> friends = [
    {
      'image': 'assets/images/view-map/friend-1.png',
      'name': 'Alex Lee',
      'followers': '2k',
    },
    {
      'image': 'assets/images/view-map/friend-2.png',
      'name': 'Micheal Ulasi',
      'followers': '56',
    },
    {
      'image': 'assets/images/view-map/friend-3.png',
      'name': 'Cristofer',
      'followers': '300',
    },
    {
      'image': 'assets/images/view-map/friend-4.png',
      'name': 'David  Silbia',
      'followers': '5k',
    },
    {
      'image': 'assets/images/view-map/friend-5.png',
      'name': 'Ashfak Sayem',
      'followers': '402',
    },
    {
      'image': 'assets/images/view-map/friend-6.png',
      'name': 'Rocks Velkeinjen',
      'followers': '893',
    },
    {
      'image': 'assets/images/view-map/friend-7.png',
      'name': 'Roman Kutepov',
      'followers': '225',
    },
    {
      'image': 'assets/images/view-map/friend-8.png',
      'name': 'Cristofer Nolan',
      'followers': '322',
    },
    {
      'image': 'assets/images/view-map/friend-9.png',
      'name': 'Jhon Wick',
      'followers': '256',
    },
    {
      'image': 'assets/images/view-map/friend-10.png',
      'name': 'Zenifero Bolex',
      'followers': '3k',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Friends',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              buildEventsTab(themeProvider),
              buildSearch(context),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      itemCount: friends.length,
                      padding: EdgeInsets.only(
                        top: 16.h,
                        bottom: MediaQuery.of(context).size.width * .3,
                        left: 24.w,
                        right: 24.w,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isTicked[index] = !isTicked[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 22.5.r,
                                  backgroundColor: Colors.white,
                                  backgroundImage: Image.asset(
                                    friends[index]['image'],
                                    height: 45.h,
                                    width: 45.w,
                                    fit: BoxFit.fitWidth,
                                  ).image,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AirBnBText(
                                          friends[index]['name'],
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        AirBnBText(
                                          '${friends[index]['followers']} followers',
                                          textAlign: TextAlign.right,
                                          color: gray400,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/svg/view-map/${isTicked[index] ? 'select' : 'no-select'}.svg',
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      // height: MediaQuery.of(context).size.height * .6,
                      child: ListView.builder(
                        itemCount: friends.length,
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: MediaQuery.of(context).size.width * .3,
                          left: 24.w,
                          right: 24.w,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isTicked[index] = !isTicked[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.5.r,
                                    backgroundColor: Colors.white,
                                    backgroundImage: Image.asset(
                                      friends[index]['image'],
                                      height: 45.h,
                                      width: 45.w,
                                      fit: BoxFit.fitWidth,
                                    ).image,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AirBnBText(
                                            friends[index]['name'],
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AirBnBText(
                                            '${friends[index]['followers']} followers',
                                            textAlign: TextAlign.right,
                                            color: gray400,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (pageIndex == 0)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 27.h),
              child: ArrowButton(
                text:
                    'UNFOLLOW (${isTicked.where((element) => element).length})',
                onPressed: () {},
              ),
            ).animate().fadeIn(duration: .5.seconds),
        ],
      ),
    );
  }

  Padding buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 10.h,
        bottom: 0.h,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/search-orange.svg',
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24.sp,
              ),
              cursorColor: lightOrangeColor,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: gray300,
                  fontSize: 24.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildEventsTab(ThemeProvider themeProvider) {
    return Container(
      width: double.maxFinite,
      height: 45.h,
      margin: EdgeInsets.symmetric(
        horizontal: 40.w,
        vertical: 10.h,
      ),
      padding: EdgeInsets.all(5.sp),
      decoration: ShapeDecoration(
        color: themeProvider.themeType == ThemeType.light
            ? Colors.black.withOpacity(0.02)
            : const Color(0xED191818),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (pageIndex == 0)
              ? Container(
                  width: 145.w,
                  height: double.maxFinite,
                  decoration: ShapeDecoration(
                    color: themeProvider.themeType == ThemeType.light
                        ? Colors.white
                        : HexColor('#2C2A27'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: ShaderMask(
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
                      child: DMSansText(
                        'FOLLOWING',
                        textAlign: TextAlign.center,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => setState(() {
                    pageIndex = 0;
                    if (mounted) {
                      pageController.animateToPage(
                        0,
                        duration: .5.seconds,
                        curve: Curves.easeInOut,
                      );
                    }
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: DMSansText(
                      'FOLLOWING',
                      textAlign: TextAlign.center,
                      color: HexColor('#9B9B9B'),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
          (pageIndex == 1)
              ? Container(
                  width: 145.w,
                  height: double.maxFinite,
                  decoration: ShapeDecoration(
                    color: themeProvider.themeType == ThemeType.light
                        ? Colors.white
                        : HexColor('#2C2A27'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: ShaderMask(
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
                      child: DMSansText(
                        'FOLLOWERS',
                        textAlign: TextAlign.center,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => setState(() {
                    pageIndex = 1;
                    if (mounted) {
                      pageController.animateToPage(
                        1,
                        duration: .5.seconds,
                        curve: Curves.easeInOut,
                      );
                    }
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: DMSansText(
                      'FOLLOWERS',
                      textAlign: TextAlign.center,
                      color: HexColor('#9B9B9B'),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final scrollController = ScrollController();
  Map orderSummary = {
    'Event Name': 'My Event Party',
    'Type of Ticket': 'Premium Ticket',
    'Number of Ticket': 'One (1)',
    'Coupon Code Discount': '%10',
    'Total': '\$35.00',
  };

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: themeProvider.themeType == ThemeType.light
            ? lightBackgroundColor
            : (scrollController.hasClients)
                ? (scrollController.position.pixels > 0)
                    ? darkBackgroundColor
                    : Colors.transparent
                : Colors.transparent,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        title: DMSansText(
          'Checkout',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeProvider.themeType == ThemeType.light
                  ? lightBackgroundColor
                  : null,
              image: themeProvider.themeType == ThemeType.light
                  ? null
                  : const DecorationImage(
                      image: AssetImage(
                          'assets/images/dark-gradient-background.png'),
                      fit: BoxFit.cover,
                    ),
            ),
            child: ListView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                buildTicket(themeProvider, context),
                buildCoupon(context, themeProvider),
                buildOrderSummary(context, themeProvider),
                buildPaymentMethods(context, themeProvider),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              themeProvider.themeType == ThemeType.light
                  ? Blur(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        height: 84.h,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: double.maxFinite,
                      height: 84.h,
                      decoration: ShapeDecoration(
                        color: darkBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
              Container(
                width: double.maxFinite,
                height: 84.h,
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 22.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          child: DMSansText(
                            '\$35.00',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        DMSansText(
                          'You\'re going +1',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#767676').withOpacity(.76),
                        ),
                      ],
                    ),
                    ZoomTapAnimation(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 13.h, horizontal: 20.w),
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0, -1),
                            end: const Alignment(0, 1),
                            colors: [
                              lightOrangeColor,
                              darkOrangeColor,
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                        ),
                        child: DMSansText(
                          'Proceed',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildTicket(ThemeProvider themeProvider, BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(26.w, 26.h, 32.w, 38.h),
      color: themeProvider.themeType == ThemeType.light
          ? lightBackgroundColor
          : Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/get-ticket/price-pic.png',
                width: 79.w,
                height: 79.h,
              ),
              SizedBox(width: 18.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DMSansText(
                      'International kids safe parents night out',
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h),
                    DMSansText(
                      '10 spot left',
                      color: HexColor('#747688'),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 6.w),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkOrangeColor,
                    lightOrangeColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: DMSansText(
                  '\$35.00',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        size: 20.sp,
                      ),
                      SizedBox(width: 12.w),
                      DMSansText(
                        'Show benefit',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 21.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                        color: HexColor('#979797').withOpacity(.12),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: HexColor('#979797'),
                          size: 18.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                          '1',
                          textAlign: TextAlign.center,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 21.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                        color: HexColor('#979797').withOpacity(.12),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: HexColor('#979797'),
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildCoupon(BuildContext context, ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          color: HexColor('#D8D8D8').withOpacity(.3),
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 27.w,
          ),
          child: DMSansText(
            'Coupon Code',
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          color: themeProvider.themeType == ThemeType.light
              ? lightBackgroundColor
              : Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 48.h,
            horizontal: 29.w,
          ),
          child: Container(
            height: 56.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 13.h,
              horizontal: 16.w,
            ),
            decoration: ShapeDecoration(
              color: themeProvider.themeType == ThemeType.light
                  ? lightBackgroundColor
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: HexColor('#E4DFDF'),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14.sp,
                    ),
                    cursorColor: lightOrangeColor,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Enter Code',
                      hintStyle: TextStyle(
                        color: gray300,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 11.w),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: DMSansText(
                      'Redeem',
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildOrderSummary(BuildContext context, ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          color: HexColor('#D8D8D8').withOpacity(.3),
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 27.w,
          ),
          child: DMSansText(
            'Order Summary',
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          color: themeProvider.themeType == ThemeType.light
              ? lightBackgroundColor
              : Colors.transparent,
          padding: EdgeInsets.all(26.sp),
          child: Container(
            color: themeProvider.themeType == ThemeType.light
                ? HexColor('#D9D9D9').withOpacity(.12)
                : HexColor('#D8D8D8').withOpacity(.3),
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 22.h,
            ),
            child: Column(
              children: orderSummary
                  .map((key, value) {
                    return MapEntry(
                      key,
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DMSansText(
                              '$key:',
                              color: HexColor('#807A7A'),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            DMSansText(
                              value,
                              color: themeProvider.themeType == ThemeType.light
                                  ? HexColor('#060518').withOpacity(.66)
                                  : lightBackgroundColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Column buildPaymentMethods(
      BuildContext context, ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          color: HexColor('#D8D8D8').withOpacity(.3),
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 27.w,
          ),
          child: DMSansText(
            'Payment Method',
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          color: themeProvider.themeType == ThemeType.light
              ? lightBackgroundColor
              : Colors.transparent,
          padding: EdgeInsets.only(top: 24.h, bottom: 65.h),
          child: Column(
            children: [
              Divider(
                color: HexColor('#D8D8D8'),
              ),
              Container(
                height: 64.h,
                padding: EdgeInsets.only(left: 27.w, right: 19.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DMSansText(
                          '\$100.00',
                          color: themeProvider.themeType == ThemeType.dark
                              ? Colors.white
                              : Colors.black.withOpacity(.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 2.h),
                        DMSansText(
                          'Wallet',
                          color: themeProvider.themeType == ThemeType.dark
                              ? Colors.white
                              : Colors.black.withOpacity(.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Container(
                      width: 19.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: themeProvider.themeType == ThemeType.dark
                              ? Colors.white
                              : Colors.black.withOpacity(.7),
                          width: 1.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: HexColor('#D8D8D8'),
              ),
              Container(
                height: 64.h,
                padding: EdgeInsets.only(left: 27.w, right: 19.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DMSansText(
                      'Pay Online',
                      color: themeProvider.themeType == ThemeType.dark
                          ? Colors.white
                          : Colors.black.withOpacity(.7),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    Container(
                      width: 19.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: themeProvider.themeType == ThemeType.dark
                              ? Colors.white
                              : Colors.black.withOpacity(.7),
                          width: 1.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: HexColor('#D8D8D8'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

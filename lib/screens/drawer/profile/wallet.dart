import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOrangeColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 8.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          DMSansText(
                            'My Balance',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                        ],
                      ),
                      Row(
                        children: [
                          DMSansText(
                            'USD',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      DMSansText(
                        '\$8,656.60',
                        color: Colors.white,
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 45.5.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.r),
                                  ),
                                ),
                                showDragHandle: true,
                                constraints: BoxConstraints.tight(
                                  Size(
                                    MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height * .5,
                                  ),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 29.w),
                                    child: Column(
                                      children: [
                                        // SizedBox(height: 18.h),
                                        DMSansText(
                                          'Fund Wallet',
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const Spacer(),
                                        AppTextField(
                                          hintText: 'Select Currency',
                                          trailing: Icon(
                                            Icons.chevron_right,
                                            color: HexColor('#979797'),
                                          ),
                                        ),
                                        SizedBox(height: 22.h),
                                        AppTextField(
                                          hintText: 'Enter Amount',
                                          trailing: Icon(
                                            Icons.chevron_right,
                                            color: HexColor('#979797'),
                                          ),
                                        ),
                                        const Spacer(),
                                        ArrowButton(
                                          text: 'FUND',
                                          onPressed: () {},
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/drawer/profile/wallet/money-recive.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              DMSansText(
                                'Fund',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 1.w,
                          height: 32.h,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/drawer/profile/wallet/money-send.svg',
                              width: 20.w,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            DMSansText(
                              'Withdraw',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            buildTransactions(),
          ],
        ),
      ),
    );
  }

  Expanded buildTransactions() {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.w, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                DMSansText(
                  'Transactions',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                    leading: DMSansText(
                      '20 - 01 2023, 06:00 PM',
                      color: HexColor('#9E9E9E'),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Column(
                      children: [
                        AirBnBText(
                          '-\$1,200.00',
                          color: HexColor('#D86045'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        AirBnBText(
                          'Completed',
                          color: HexColor('#9E9E9E'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

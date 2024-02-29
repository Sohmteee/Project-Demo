import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
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
                        Row(
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
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: DMSansText(
                      '20 - 01 2023, 06:00 PM',
                      color: HexColor('#9E9E9E'),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
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

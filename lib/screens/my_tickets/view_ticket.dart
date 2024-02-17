import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

class ViewTicketScreen extends StatefulWidget {
  const ViewTicketScreen({super.key});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 60.sp),
                  padding: EdgeInsets.all(18.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/view-ticket/event-pic.png'),
                      SizedBox(height: 16.h),
                      DMSansText(
                        'Coldplay : Music of the Spheres',
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      DMSansText(
                        'Nov 15 2023 ~ Gelora Bung Karno Stadium, Jakarta',
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 40.h),
                      TicketDetails(
                          name: 'Indriyani Puspita',
                          orderNumber: 'CLD09738PL',
                          date: date,
                          time: time,
                          gate: gate,
                          serialNumber: serialNumber)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({
    super.key,
    required this.name,
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.gate,
    required this.serialNumber,
  });

  final String name;
  final String orderNumber;
  final String date;
  final String time;
  final String gate;
  final int serialNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(),
      ],
    );
  }
}

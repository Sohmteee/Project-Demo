import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/models/text.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 30.h,
                  bottom: 28.h,
                ),
                child: Row(
                  children: [
                    BackButton(color: Theme.of(context).colorScheme.secondary),
                    DMSansText(
                      'Get a Ticket',
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
      body: Column(),
    );
  }
}

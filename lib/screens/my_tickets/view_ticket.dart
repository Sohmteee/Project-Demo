import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/screens/get_ticket.dart';

/// A screen widget that displays the details of a ticket.
///
/// This widget is used to show the information related to a ticket, such as the concert title, location, ticket holder name, order number, date, time, gate, and serial number. It also includes a barcode image and instructions for presenting the serial number at the entry gate.
///
/// The [ViewTicketScreen] class extends the [StatefulWidget] class and requires a [key] parameter. It creates an instance of the [_ViewTicketScreenState] class as its state.
///
/// Example usage:
/// ```dart
/// ViewTicketScreen(
///   key: Key('ticketScreen'),
/// )
/// ```
class ViewTicketScreen extends StatefulWidget {
  const ViewTicketScreen({super.key});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  final String concertTitle = 'Coldplay : Music of the Spheres';
  final String concertLocation =
      'Nov 15 2023 ~ Gelora Bung Karno Stadium, Jakarta';
  final String ticketHolderName = 'Indriyani Puspita';
  final String ticketOrderNumber = 'CLD09738PL';
  final String ticketDate = 'Nov 15, 2024';
  final String ticketTime = '9:00 PM';
  final String ticketGate = 'Yellow';
  final int ticketSerialNumber = 1234568;

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
              Container(
                clipBehavior: Clip.hardEdge,
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
                      concertTitle,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    DMSansText(
                      concertLocation,
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 40.h),
                    TicketDetails(
                      name: ticketHolderName,
                      orderNumber: ticketOrderNumber,
                      date: ticketDate,
                      time: ticketTime,
                      gate: ticketGate,
                      serialNumber: ticketSerialNumber,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        DashDivider(
                          color: Colors.grey[400]!,
                        ),
                        Positioned(
                          left: -(17.5 + 18).w,
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  lightOrangeColor,
                                  darkOrangeColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -(17.5 + 18).w,
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  lightOrangeColor,
                                  darkOrangeColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/view-ticket/bar-code.png',
                            ),
                            SizedBox(height: 12.h),
                            DMSansText(
                              'Present your serieal Number (S/N) above \nat the entry gate',
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ],
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
    final Color greyColor = Colors.grey[400]!;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return ListView(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: DMSansText(
                  'Name',
                  color: greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              DMSansText(
                name,
                color: secondaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: DMSansText(
                  'Date',
                  color: greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              DMSansText(
                date,
                color: secondaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: DMSansText(
                  'Gate',
                  color: greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              DMSansText(
                gate,
                color: secondaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: DMSansText(
                'Order Number',
                color: greyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            DMSansText(
              orderNumber,
              color: secondaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: DMSansText(
                'Time',
                color: greyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            DMSansText(
              time,
              color: secondaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: DMSansText(
                'Serial Number',
                color: greyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            DMSansText(
              serialNumber.toString(),
              color: secondaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

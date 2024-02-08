import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/screens/calendar/event.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final now = DateTime.now();
  late final DateTime _firstDay;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  late final ValueNotifier<List<Event>> _selectedEvents;
  List<Event> events = [];

  List<Event> _getEventsForDay(DateTime day) {
    return events.where((event) => event.day == day).toList();
    // return kEvents[day] ?? [];
  }

  Color eventColor(int index) {
    return switch (index % 3) {
      0 => HexColor('#3D50DF'),
      1 => HexColor('#F1573D'),
      2 => HexColor('#29D697'),
      _ => Colors.transparent,
    };
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _firstDay = DateTime.utc(now.year, now.month, 1);
    for (int index = 0; index < 2 * 365; index++) {
      for (int rand = 0; rand < Random().nextInt(4); rand++) {
        events.add(
          Event(
            day: _firstDay.add(index.days),
            title: 'International Kids Day',
            description: 'Start from screen 16',
          ),
        );
      }
    }
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Calendar',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(now.year, now.month, 1),
            lastDay: DateTime.utc(
              now.add((2 * 365).days).year,
              now.month,
              now.day,
            ),
            focusedDay: _focusedDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarFormat: CalendarFormat.month,
            eventLoader: _getEventsForDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents.value = _getEventsForDay(selectedDay);
                });
              }
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                List<Color> colors = [
                  HexColor('#00B383'),
                  darkOrangeColor,
                  HexColor('#0095FF'),
                ];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _getEventsForDay(day).length,
                    (index) => Container(
                      width: 4.sp,
                      height: 4.sp,
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: colors[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            calendarStyle: CalendarStyle(
              tablePadding: EdgeInsets.symmetric(horizontal: 5.w),
              defaultTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              canMarkersOverflow: true,
              markersMaxCount: 3,
              // markerDecoration: const BoxDecoration(),
              markersAnchor: -.4,
              markerMargin: EdgeInsets.symmetric(horizontal: 1.w),
              markerSize: 4.sp,
              markerDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: HexColor('#00B383'),
                ),
              ),
              selectedDecoration: BoxDecoration(
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
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    HexColor('#3D50DF'),
                    HexColor('#EB5757'),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
              weekendStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).colorScheme.secondary,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
              headerMargin: EdgeInsets.symmetric(horizontal: 40.w),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _getEventsForDay(_selectedDay).length,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 50.h,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 43.w,
                          height: 43.h,
                          decoration: BoxDecoration(
                            color: eventColor(index).withOpacity(.16),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AirBnBText(
                                switch (_selectedDay.month) {
                                  1 => 'JAN',
                                  2 => 'FEB',
                                  3 => 'MAR',
                                  4 => 'APR',
                                  5 => 'MAY',
                                  6 => 'JUNE',
                                  7 => 'JUL',
                                  8 => 'AUG',
                                  9 => 'SEP',
                                  10 => 'OCT',
                                  11 => 'NOV',
                                  12 => 'DEC',
                                  _ => ''
                                },
                                color: eventColor(index),
                                fontSize: 13.sp,
                              ),
                              AirBnBText(
                                '${_selectedDay.day.toString().length == 1 ? '0' : ''}${_selectedDay.day}',
                                color: eventColor(index),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        AirBnBText('${switch (now.weekday) {
                          1 => 'Mon',
                          1 => 'Mon',
                          1 => 'Mon',
                          1 => 'Mon',
                          1 => 'Mon',
                          1 => 'Mon',
                          1 => 'Mon',
                          _ => '',
                        }}'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

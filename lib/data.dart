// ignore_for_file: deprecated_member_use

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';

late String storageLocation;

List categories = [
  {
    'title': 'MUSIC',
    'color': blueColorCategory,
  },
  {
    'title': 'COMEDY',
    'color': redColorCategory,
  },
  {
    'title': 'MOVIE EVENT',
    'color': greenColorCategory,
  },
];

List newPopUpItems = [
  {
    'title': 'New Outdoor Event',
    'subtitle': 'For general purpose concerts or events.',
    'icon-color': HexColor('#3D50DF'),
    'background-color': const Color(0x1C3C4FDF),
  },
  {
    'title': 'New Movie Show',
    'subtitle': 'For Cinemas',
    'icon-color': HexColor('#F1573D'),
    'background-color': const Color(0x1CF1573D),
  },
  {
    'title': 'New Virtual Event',
    'subtitle': 'For online tutoring sessions',
    'icon-color': HexColor('#FFB459'),
    'background-color': const Color(0x59F6EF97),
  },
  {
    'title': 'New Appointment Booking',
    'subtitle':
        'For paid one-on-one virtual or physical meetings, consultation, etc',
    'icon-color': HexColor('#00B6AA'),
    'background-color': const Color(0x3300B6AA),
  },
];

List upcomingEvents = [
  {
    'image': 'assets/images/home/upcoming-event-1.png',
    'title': 'International Band Mu...',
    'price': 'FREE - \$25',
    'location': '36 Guild Street London, UK',
    'date-color': Colors.white,
    'time': DateTime(2024, 06, 10),
  },
  {
    'image': 'assets/images/home/upcoming-event-2.png',
    'title': 'Jo Malone London’s Mo..',
    'price': '\$5 - \$25',
    'location': 'Radius Gallery • Santa Cruz, CA',
    'date-color': redColorCategory,
    'time': DateTime(2024, 06, 10),
  },
];

String profilePath = 'assets/images/home/profile.png';
String dp1Path = 'assets/images/home/dp1.png';
String dp2Path = 'assets/images/home/dp2.png';
String dp3Path = 'assets/images/home/dp3.png';

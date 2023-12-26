import 'package:yeerlo/colors/app_colors.dart';
import 'package:flutter/material.dart';

bool isLightTheme = false;

List categories = [
  {
    'title': 'Music',
    'color': blueColorCategory,
  },
  {
    'title': 'Comedy',
    'color': redColorCategory,
  },
  {
    'title': 'Movie Event',
    'color': greenColorCategory,
  },
];

List upcomingEvents = [
  {
    'image': 'assets/images/event-cover-1.png',
    'title': 'International Band Mu...',
    'location': '36 Guild Street London, UK',
    'date-color': Colors.white,
  },
  {
    'image': 'assets/images/event-cover-2.png',
    'title': 'Jo Malone London’s Mo..',
    'location': 'Radius Gallery • Santa Cruz, CA',
    'date-color': redColorCategory,
  },
];

List drawerOptions = [
  {
    'icon': 'assets/svg/drawer/user.svg',
    'title': 'My Profile',
  },
  {
    'icon': 'assets/svg/drawer/wallet.svg',
    'title': 'Wallet',
  },
  {
    'icon': 'assets/svg/drawer/check-in-pass.svg',
    'title': 'Check-in Pass',
  },
  {
    'icon': 'assets/svg/drawer/bookmark.svg',
    'title': 'Event Status',
  },
  {
    'icon': 'assets/svg/drawer/settings.svg',
    'title': 'Settings',
  },
  {
    'icon': 'assets/svg/drawer/sign-out.svg',
    'title': 'Sign Out',
  },
];

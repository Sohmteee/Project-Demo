import 'package:yeerlo/colors/app_colors.dart';
import 'package:flutter/material.dart';

// bool isLightTheme = true;

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
    'image':
        'https://s3-alpha-sig.figma.com/img/cf89/f286/a90acbf4be81870f1581c08347af55b4?Expires=1704672000&Signature=WGojukzwikT4gp~nTAFS4wMJhvDHCg9FiYVG~7BxnrF~Sxydw8akPlDO8J8wkJqXvEl-Aag6lYhGia~dislgLGMJVkU6fkXDtkRmwSwub85caGcKJkcxRSmCnp8tgwMpd5iyfZKabEFyY0G4HOI5mLR~intsGP5agsha9yf2TOihSqD8MKsdyla6XGohOjzJccmQuZBQhdG98YL~bddZM7feL3nDoHsDQBKCPxmOZIWtmni-1k2M5tT4wBnW2INQxO1IMlzol7K9fLJ-B437fw3O3dq6lAcLLAPw3oAB-5rg~GuD5M6p0v8vGupk6rhwxGKo-c2o1ymb3FlJw68vJQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'title': 'International Band Mu...',
    'price': 'FREE - \$25',
    'location': '36 Guild Street London, UK',
    'date-color': Colors.white,
    'time': DateTime(2024, ),
  },
  {
    'image':
        'https://s3-alpha-sig.figma.com/img/6c71/bf2d/805db991ea266144b48ac8adde78bcf0?Expires=1704672000&Signature=NTqe4eocgf8vPC-tUP2tcQ10q~Wit5MH9n6vyn~F6Hal3n3Yri~PjxaAljBV86ZjLl9vdyRoy5xqvmGcCS7AJ3egxPntN99CELGWkxCjvONb7diL5bTkcj8qni7cXDxE9bmsUmonmUgA5AfNsHw-puejuy1CrofQvhXsw2hLxOG3WfTu2PfFa1SS5CNX-cb0ljz5lLpSmF-gvh6LhbZW~azADE-OtmPEPfp3RZWxwGbEr3bDvWErMu37U0cJ8lE4Ed900Bl11AepT9UyX-SLg27W~mqwMKgxzeQ033QUMeULUIE5qluEx9ga4J00YJ3RyApEDBc7SkOXXSVf9MF1Ag__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'title': 'Jo Malone London’s Mo..',
    'price': '\$5 - \$25',
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

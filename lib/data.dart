// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:yeerlo/colors/app_colors.dart';

late String storageLocation;

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
    'time': DateTime(2024, 06, 10),
  },
  {
    'image':
        'https://s3-alpha-sig.figma.com/img/6c71/bf2d/805db991ea266144b48ac8adde78bcf0?Expires=1704672000&Signature=NTqe4eocgf8vPC-tUP2tcQ10q~Wit5MH9n6vyn~F6Hal3n3Yri~PjxaAljBV86ZjLl9vdyRoy5xqvmGcCS7AJ3egxPntN99CELGWkxCjvONb7diL5bTkcj8qni7cXDxE9bmsUmonmUgA5AfNsHw-puejuy1CrofQvhXsw2hLxOG3WfTu2PfFa1SS5CNX-cb0ljz5lLpSmF-gvh6LhbZW~azADE-OtmPEPfp3RZWxwGbEr3bDvWErMu37U0cJ8lE4Ed900Bl11AepT9UyX-SLg27W~mqwMKgxzeQ033QUMeULUIE5qluEx9ga4J00YJ3RyApEDBc7SkOXXSVf9MF1Ag__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'title': 'Jo Malone London’s Mo..',
    'price': '\$5 - \$25',
    'location': 'Radius Gallery • Santa Cruz, CA',
    'date-color': redColorCategory,
    'time': DateTime(2024, 06, 10),
  },
];

String profilePath =
    'https://s3-alpha-sig.figma.com/img/33a1/6235/683e964c0fac3a1028da033d96e5dd5d?Expires=1704672000&Signature=JQ0~OKDWlMmTbGlNiyaxKq6TXJs6auZT7Aj4mDom4MvCaN3maT0qzKlE6L3UFRhrBhojvuQ~2UQbv6~G7TBZMe3-BXqH-VDnDT2aBp3HEdqsRM-G6MppsNIOdI~bY40JIoizNg7o-hwy0uRkBrfxSGGU0z-BGOdgeqFdSVRvKKFwIiW1VzJaQSDURks8sI3QU1ZsMzTb-KNiMXUFR4u9AJtUePaduJE-LgblwJxnE9VCSyf1r0Ichq~JsLBClMtwBokWbuwI5mgeEwdhGAx4SP1TQAa05AAOF6UBJlZNYoz0rCXkg~9HwFs3XDC0qXJL0TAVg2e86fAzws1L8d8lxg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';
String dp2Path =
    'https://s3-alpha-sig.figma.com/img/2902/8b47/6eedca800bd259b5877f98458c1ec66a?Expires=1704672000&Signature=WJ3oY48md8MaDmsbbtjMA58LNkLMbz~EpHsSjDKfgeDCcUubBt1WhRctqWRSzGf0oJ6Koo1wlMMviGMQmxsRoss1OG8dMqA1tGBdHqge3ESQOwHahqg6K1ztJN6o8LpTU8bnPnjOC8JReyXyA3mF0eTBf22a7NxAUomvhMhIbrRUvycmI3BSRetUJR1iQuTckwR7YmoqNdlfPNz28xAzRrT0iE0hccnSwPef1Nkx9MqBXfqREtumY~BIuYIq1~e0TfZ5Mk660suy6wwF9KkLnUgwhrlw8sJfyxfPUz9QOP0KXRIFA1~XjAkG10TmT9qPwSXs6i7qRHF65-41~xqydg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';
String dp3Path =
    'https://s3-alpha-sig.figma.com/img/e6e0/802c/b43aceb267d24e6c72e464bbc8fa5f13?Expires=1704672000&Signature=kQjSDvPxiZSZcbRKp-T6Lty1fua7vGtBVQi5lTyEmtbMj~-6JR7TfO8y3Sa~5TLt1uPxa30ZEe6pJeCDyNX5tnqWn65s8uOwheBlANQbB9Du8zkGehJ8HdTGXT3L6T0Z9oGkpr8QbMHW-mBKsdyERxVNqyVwXmBx7p~AFfACNb0TWtbp26PKenfewx1yFu1Y1cQZ2fAfpf3aWIsfhDgZzEOfY~1l2B3Zt9Pf3ZxsELXPiyotp089fLnvfQBt7eNqgGUEwqN3J509d3QCNq6Ogqme962M1ofHik7MdbaCw88K95nfTCt0NnQIIyyoNh2xkZzJxBsfyBWn3WzK2RTCWA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';
String dp1Path =
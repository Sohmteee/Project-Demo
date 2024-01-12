// ignore_for_file: deprecated_member_use

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
    'icon-color': HexColor('#767676'),
    'background-color': const Color(0x59F6EF97),
  },
  {
    'title': 'New Appointment Booking',
    'subtitle':
        'For paid one-on-one virtual or physical meetings, consultation, etc',
    'icon-color': HexColor('#767676'),
    'background-color': const Color(0x3300B6AA),
  },
];

List upcomingEvents = [
  {
    'image':
        'https://s3-alpha-sig.figma.com/img/cf89/f286/a90acbf4be81870f1581c08347af55b4?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=c9calrmjqXKgNoRcEB7~L5bIRTVKaHYTgkQNJc-D0~UDcyzXaR0uzhyj4W191D1E8VPpxnDYziwvC86H9DFb4OvAB6V2qsjBYXpJF7RqIjnVhyLbNURxcQUCQEnzBzzxezA0zaYxxpdipaRSb6oDUcEOtAiciMNKXx6V1fl1jPzVw6zsrk4Dgf7wMJ4CIxgSOj-jmsV3vktc7O6WPkrx~Aaot4JSfLtbRz8UOFbOK-gIAMJCEB1Sf5cKwcTrRsDKXK~yg5hbd50tX25yY6Gx0F8qcriCTyEJDSdahog-9Bv0VlKGqHgYrDxmXOMf3hG96H5tg1Seh5VFuJ5VH~OKDA__',
    'title': 'International Band Mu...',
    'price': 'FREE - \$25',
    'location': '36 Guild Street London, UK',
    'date-color': Colors.white,
    'time': DateTime(2024, 06, 10),
  },
  {
    'image':
        'https://s3-alpha-sig.figma.com/img/6c71/bf2d/805db991ea266144b48ac8adde78bcf0?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lx~xIMW71wiBQXOvRA9MhPPYwMVz0mHI8g8ZqUWeHRs-RaSMNGxmrm8k4VwPxtw-m5c-Yw5QqLzO99aAAkFWrEotcGgn08-b0sdI8qKGHciFZkZXkcWwc~k~dhKhxfvEJlh6MMQlbGRrUGKpqMuod5XMbsQ6yx5dZn2EzQxWFLkkq~2bzQHfyBthF7UkeptiOva4EiO09YbF565PlQwJObqCt8mGVSuAxkKsWUGy8O9iMAXT~bxXWmWpaeUQvv70OcLzbigl4is7g6Z3n~~~Fw81zFzte-7TxEaNQI8pgBAbn3wGFYqtUQssRinJAriJcj3QRMy6e8WfZ2wb4k4QTw__',
    'title': 'Jo Malone London’s Mo..',
    'price': '\$5 - \$25',
    'location': 'Radius Gallery • Santa Cruz, CA',
    'date-color': redColorCategory,
    'time': DateTime(2024, 01, 12, 1, 39),
  },
];

String profilePath =
    'https://s3-alpha-sig.figma.com/img/33a1/6235/683e964c0fac3a1028da033d96e5dd5d?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ha3sjm64LwXQhz1HE13CuNNQHr-cFmU4Qft8jZE3uVZIe6FNtab0IOYqOWPiQIn3YE8BYYUa9deE8E47SKNskdBypeeAbhhNFwPwCLrrFLyM7lV2WxwxBsD6rzvTTZ~hSbmT891I8pjlPI9pkVOYMQMtSscV~z5lUx-HnJaMSpgcxjwBIfpQkrXY-tO8qnbZlyhZnkE6rnSzHYoJO~0VDS8XGQtjqQpvx~jkw57LQGSdteGkYf1v~xKeMbqphQGRVILZt67inDa-RxLOGf0fAc2OMPRXRPRipcCSjOX-80zbGmKV~fXaDE8evly9TBVIELQZuhX~KtBd~7i0UGdPUw__';
String dp1Path =
    'https://s3-alpha-sig.figma.com/img/a511/6394/d8c24efab59533add110ee8338355c42?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E4OTaGoqXnK1IhSR-NE0zXSZcUOZQYip9zwTPSJHIJJdut387aniq6Gl-edufUpe5WfmSAMnauN-oiROqGalslATdHMF5T43S9SVNKfyqcW0DD1yfzILtZQ~ktKLSDn8hlwgAbY3fnvpwA9VQYGhvsyoxBN~Kmd0u1jkCjzL3vBAzWweM6B1LPlZViIeI4~mDlR3Pwivwno-NsG9riGSb8lbPo5UpsXFMC9U7B0l8ob06qtn99l1kp~cOKlteO5cLc5CbXt2oKWxW6BdspA-59ql7zZvkJe7-YvrJwFC~hXPh1f403ct79mM6GFaD6SLdBEWVFneVOxhBDjI7Un8PA__';
String dp2Path =
    'https://s3-alpha-sig.figma.com/img/2902/8b47/6eedca800bd259b5877f98458c1ec66a?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=My9nFVchGHFfanKXXK~6XMlAsRW-~fhhiJy6Cy0rcxaN5q3SPNGP3BswZYitktOYD1Oc12Tzi2YXuUAiqFSHOX7DDOWZeHoNvWisPRZiwIE2ChuFQD0gck~yhH2bW9vgsyJiRNCu3Oup11YVRCFA13KMpIbpNuv9xnyMrPwGr1Dj9wu-H9TPL9eWHG3fg4TMJzx21NEDoyS50Ii-7pfXg4N2LJ0vXL2Pj1DoN~E9DpzXp~tX9Prlk2q~9~fXJA~GOGmC7Lt7ayj6WjSc3PXrXd~eIZ-PiNnArTxWPRN~soXqM-nY5k3y57puPIvk0al4QGt~T8ADWsdwxD9YGuViLQ__';
String dp3Path =
    'https://s3-alpha-sig.figma.com/img/e6e0/802c/b43aceb267d24e6c72e464bbc8fa5f13?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=i4lCp0L13fN4xVS4vzPdLBUCt7tm6KmBwVGpOAG1rIQJ37TEs8RT8AqM4c8N2xW0tg57D3Y5fIaoMLq9joaraou1~YLJ1JhZMnjh5NGrVAmUucOKPul-S3Q9XykZ24ySHNpRXbXIxuOdhZmxHvgmDhm-0bQ-mk0sgseEf0yprDFrhl00IwLt1sertUredzxV0AioJB4gD8MvYs6auRiolkEyO4IdBZ51xO-4PuPP8qzCpielNE-pZ-YdfpjVZSIDQ0pG7A862iCcFkE9awL1v1KNz6zLdNDRI2PVz42UQt524cAnfNYuluRMNrgarh7jy5aMdMxasFbuZT2CR8y0dA__';

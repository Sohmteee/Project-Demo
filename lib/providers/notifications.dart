import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier{
  List notificatons = [
    {
      'comment': 'Nice Event',
      'time': DateTime.now(),
    },
    {
      'comment': 'Nice Event',
      'time': DateTime.now(),
    },
    {
      'comment': 'Nice Event',
      'time': DateTime.now(),
    },
  ];
}
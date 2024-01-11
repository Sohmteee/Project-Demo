import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NotificationProvider extends ChangeNotifier {
  List notificatons = [];

  showNoNotification() {
    notificatons.clear();
  }
}

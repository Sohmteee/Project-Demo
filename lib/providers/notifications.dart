import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Notification provider class that extends [ChangeNotifier] to manage
/// notifications state and notify listeners.
class NotificationProvider extends ChangeNotifier {
  List notificatons = [];

  showNoNotification() {
    notificatons.clear();
    notifyListeners();
  }

  showNotifications() {
    notificatons = [
      {
        'comment': 'Nice Event',
        'time': DateTime.now(),
      },
      {
        'comment': 'Enjoy Event',
        'time': DateTime.now().subtract(5.minutes),
      },
      {
        'comment': 'Nice Event',
        'time': DateTime.now().subtract(20.minutes),
      },
    ];
    notifyListeners();
  }
}

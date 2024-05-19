import 'package:flutter/cupertino.dart';

import '../../../features/opportunity/domain/entities/notifications.dart';

class NotificationsProvider with ChangeNotifier {
  List<Notifications> _notifications = [];

  List<Notifications> get notifications => _notifications;

  void addNotification(Notifications notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void removeNotification(Notifications notification) {
    _notifications.remove(notification);
    notifyListeners();
  }

  void setNotifications(List<Notifications> notifications) {
    _notifications = notifications;
    notifyListeners();
  }
}

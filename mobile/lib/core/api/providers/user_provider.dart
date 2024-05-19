import 'package:flutter/cupertino.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get User => _user;

  void addUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}

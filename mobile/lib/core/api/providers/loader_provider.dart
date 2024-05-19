import 'package:flutter/material.dart';

class LoaderProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  bool _disable = false;

  bool get disable => _disable;

  void setLoader(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }

  void setDisable(bool disable) {
    _disable=disable;
    notifyListeners();
  }
}

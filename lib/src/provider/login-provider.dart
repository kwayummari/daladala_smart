import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier {
  bool _myBool = false;

  bool get myBool => _myBool;

  void updateBool(bool newValue) {
    _myBool = newValue;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ProviderOne extends ChangeNotifier{

  bool isDark = false;

  void changeTheme(){
    isDark=!isDark;
    notifyListeners();
  }

}
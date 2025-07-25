import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  double _initialValue = 50; 

  double get getInitialValue => _initialValue;

  Future<void> onChanged(double value) async {
    _initialValue = (value * 1000).round() / 1000;
    notifyListeners();
  } 
}
 
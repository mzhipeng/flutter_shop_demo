import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

/// create by mzo
///
///
/// @auther: mzp
///
class HomePageCarProvide with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  HomePageCarProvide(this._value);

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}

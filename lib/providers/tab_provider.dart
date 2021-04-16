import 'package:flutter/material.dart';

class TabIndex with ChangeNotifier {
  int value = 2;
  double subtotal=0.0;
  double discount=0.0;
  double carttotal=0.0;

  void setIndex(int index) {
    this.value = index;
    notifyListeners();
  }
  void addTotal(double amount) {

    this.subtotal = subtotal+amount;
    this.carttotal = carttotal+amount;
    notifyListeners();
  }
  void minusTotal(double amount) {

    this.subtotal = subtotal-amount;
    this.carttotal = carttotal-amount;
    notifyListeners();
  }
 /* void addDiscount(double amount) {

    this.subtotal = subtotal-100;
    this.carttotal = carttotal-100;
    this.discount = carttotal-100;
    notifyListeners();
  }*/
}


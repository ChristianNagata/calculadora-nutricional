import 'package:flutter/material.dart';

class FormController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController desiredProtein = TextEditingController();
  final TextEditingController breastPrice = TextEditingController();
  final TextEditingController filletPrice = TextEditingController();

  // Aproximadamente 23% de proteína por kg
  final double _filletProteinPerKg = 230.0;

  // Aproximadamente 23% de proteína por kg, com 80% de rendimento
  final double _breastProteinPerKg = 230.0 * 0.8;

  double _filletCost = 0.0;
  double _breastCost = 0.0;
  double _filletKgNeeded = 0.0;

  double _breastKgNeeded = 0.0;

  // getters

  GlobalKey<FormState> get formKey => _formKey;

  double get breastValuePerKg =>
      double.parse(breastPrice.text.trim().replaceFirst(',', '.'));

  double get filletValuePerKg =>
      double.parse(filletPrice.text.trim().replaceFirst(',', '.'));

  double get desiredProteinValue =>
      double.parse(desiredProtein.text.trim().replaceFirst(',', '.'));

  double get filletCost => _filletCost;

  double get brestCost => _breastCost;

  double get filletKgNeeded => _filletKgNeeded;

  double get breastKgNeeded => _breastKgNeeded;

  double get priceDiff => (_breastCost - _filletCost).abs();

  //

  void calculateCosts() {
    _filletKgNeeded = desiredProteinValue / _filletProteinPerKg;
    _breastKgNeeded = desiredProteinValue / _breastProteinPerKg;
    _filletCost = _filletKgNeeded * filletValuePerKg;
    _breastCost = _breastKgNeeded * breastValuePerKg;
    print(_filletKgNeeded);
  }

  void clear() {
    breastPrice.clear();
    filletPrice.clear();
    _filletCost = 0;
    _breastCost = 0;
  }

  String? emptyFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }
}

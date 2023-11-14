import 'package:flutter/material.dart';
import 'package:flutter_calculator/CalculatorApp.dart';
import 'package:flutter_calculator/repositories/crypto_coins/calculator_allrep.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCalculatiorRepository>(
    () => CalculatorRepository(),
  );

  runApp(const CalculatorApp());
}

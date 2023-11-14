part of 'main_calc_bloc.dart';

abstract class MainCalcEvent {}

class MainCalcGetResult extends MainCalcEvent {
  final String exprToCalc;

  MainCalcGetResult({required this.exprToCalc});
}

class MainCalcInit extends MainCalcEvent {}

class MainCalcClickButtonOperation extends MainCalcEvent {
  final String operation;
  final String nowExpr;

  MainCalcClickButtonOperation(
      {required this.operation, required this.nowExpr});
}

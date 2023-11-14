part of 'main_calc_bloc.dart';

abstract class MainCalcState {}

//Приложение заменяет значение в поле вывода на initExpr и начинает принимать новое выражение
class MainCalcGetExpr extends MainCalcState {
  final String initExpr;

  MainCalcGetExpr({required this.initExpr});
}

//Оповещает о том, что идёт процесс расчёта значения выражения
class MainCalcCalculation extends MainCalcState {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/repositories/crypto_coins/calculator_allrep.dart';

part 'main_calc_event.dart';
part 'main_calc_state.dart';

class MainCalcBloc extends Bloc<MainCalcEvent, MainCalcState> {
  MainCalcBloc(this.coinsRepository) : super(MainCalcGetExpr(initExpr: '0')) {
    on<MainCalcGetResult>(_calc);
    on<MainCalcInit>(_init);
    on<MainCalcClickButtonOperation>(_operate);
  }

  final AbstractCalculatiorRepository coinsRepository;

  Future<void> _calc(
    MainCalcGetResult event,
    Emitter<MainCalcState> emit,
  ) async {
    emit(MainCalcCalculation());
    final String res = await this.coinsRepository.calcExpr(event.exprToCalc);
    emit(MainCalcGetExpr(initExpr: res));
  }

  Future<void> _init(
    MainCalcInit event,
    Emitter<MainCalcState> emit,
  ) async {
    emit(MainCalcCalculation());
    final String a = '0';
    emit(MainCalcGetExpr(initExpr: a));
  }

  Future<void> _operate(
    MainCalcClickButtonOperation event,
    Emitter<MainCalcState> emit,
  ) async {
    String res = event.nowExpr;
    if (event.operation == 'c') {
      res = '';
    } else {
      res += event.operation;
    }
    emit(MainCalcGetExpr(initExpr: res));
  }
}

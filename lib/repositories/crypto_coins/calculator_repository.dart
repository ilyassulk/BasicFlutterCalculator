import 'package:flutter_calculator/repositories/crypto_coins/abstarct_calculator_repository.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorRepository implements AbstractCalculatiorRepository {
  @override
  Future<String> calcExpr(String expr) {
    final calc = () async {
      try {
        var ex = expr.interpret().toString();
        return ex;
      } catch (e) {
        return "Error";
      }
    };
    //cacl
    final res = calc();
    return res;
  }
}

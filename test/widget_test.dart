// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_calculator/repositories/crypto_coins/calculator_allrep.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculatorRepository repository = CalculatorRepository();
  test('CalcExprTest', () async {
    //INIT
    String testExpr1 = "2+2*2+2";
    String testExpr2 = "9**9";
    String testExpr3 = "2.0";

    //ACT
    final testAns1 = await repository.calcExpr(testExpr1);
    final testAns2 = await repository.calcExpr(testExpr2);
    final testAns3 = await repository.calcExpr(testExpr3);

    //ASSERT
    assert(testAns1 == "8.0");
    assert(testAns2 == "Error");
    assert(testAns3 == "2.0");
  });
}

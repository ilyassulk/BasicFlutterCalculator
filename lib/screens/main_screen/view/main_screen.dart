import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/screens/main_screen/bloc/main_calc_bloc.dart';
import 'package:flutter_calculator/styles/styles.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_calculator/repositories/crypto_coins/calculator_allrep.dart';

class MainCalcScreen extends StatefulWidget {
  MainCalcScreen({super.key});

  String text = '0';

  @override
  State<MainCalcScreen> createState() => _MainCalcScreenState();
}

class _MainCalcScreenState extends State<MainCalcScreen> {
  @override
  Widget build(BuildContext context) {
    final _mainCalcBloc = MainCalcBloc(
      GetIt.I<AbstractCalculatiorRepository>(),
    );

    @override
    void initState() {
      _mainCalcBloc.add(MainCalcInit());
      super.initState();
    }

    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        backgroundColor: colorBlack,
        title: Text(
          "Flutter Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MainCalcBloc, MainCalcState>(
        bloc: _mainCalcBloc,
        builder: (context, state) {
          if (state is MainCalcCalculation) {
            return Placeholder();
          }
          if (state is MainCalcGetExpr) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 24),
                      child: Text(
                        state.initExpr,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 34),
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getButtonNumbers(
                                text: "1",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "1",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "2",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "2",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "3",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "3",
                                        nowExpr: state.initExpr))),
                            getButtonOperation(
                                text: "+",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "+",
                                        nowExpr: state.initExpr)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getButtonNumbers(
                                text: "4",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "4",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "5",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "5",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "6",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "6",
                                        nowExpr: state.initExpr))),
                            getButtonOperation(
                                text: "-",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "-",
                                        nowExpr: state.initExpr)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getButtonNumbers(
                                text: "7",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "7",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "8",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "8",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "9",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "9",
                                        nowExpr: state.initExpr))),
                            getButtonOperation(
                                text: "*",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "*",
                                        nowExpr: state.initExpr)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getButtonOperation(
                                text: "C",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "c",
                                        nowExpr: state.initExpr))),
                            getButtonNumbers(
                                text: "0",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "0",
                                        nowExpr: state.initExpr))),
                            getButtonOperation(
                                text: "=",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcGetResult(
                                        exprToCalc: state.initExpr))),
                            getButtonOperation(
                                text: "/",
                                onTap: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: "/",
                                        nowExpr: state.initExpr))),
                          ],
                        ),
                      ]),
                )
              ],
            );
          }
          return Placeholder();
        },
      ),
    );
  }
}

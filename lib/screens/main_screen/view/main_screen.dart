import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/screens/main_screen/bloc/main_calc_bloc.dart';
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
      appBar: AppBar(
        title: Text("Flutter Calculator"),
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
                            color: const Color.fromARGB(255, 250, 49, 49),
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
                            IconButton(
                              onPressed: () => _mainCalcBloc
                                  .add(MainCalcClickButtonOperation(
                                operation: '1',
                                nowExpr: state.initExpr,
                              )),
                              icon: Text("1"),
                            ),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '2',
                                        nowExpr: state.initExpr)),
                                icon: Text("2")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '3',
                                        nowExpr: state.initExpr)),
                                icon: Text("3")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '+',
                                        nowExpr: state.initExpr)),
                                icon: Text("+")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '4',
                                        nowExpr: state.initExpr)),
                                icon: Text("4")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '5',
                                        nowExpr: state.initExpr)),
                                icon: Text("5")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '6',
                                        nowExpr: state.initExpr)),
                                icon: Text("6")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '-',
                                        nowExpr: state.initExpr)),
                                icon: Text("-")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '7',
                                        nowExpr: state.initExpr)),
                                icon: Text("7")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '8',
                                        nowExpr: state.initExpr)),
                                icon: Text("8")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '9',
                                        nowExpr: state.initExpr)),
                                icon: Text("9")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '*',
                                        nowExpr: state.initExpr)),
                                icon: Text("*")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: 'c',
                                        nowExpr: state.initExpr)),
                                icon: Text("C")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '0',
                                        nowExpr: state.initExpr)),
                                icon: Text("0")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcGetResult(
                                        exprToCalc: state.initExpr)),
                                icon: Text("=")),
                            IconButton(
                                onPressed: () => _mainCalcBloc.add(
                                    MainCalcClickButtonOperation(
                                        operation: '/',
                                        nowExpr: state.initExpr)),
                                icon: Text("/")),
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

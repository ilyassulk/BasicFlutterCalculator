import 'package:flutter/material.dart';

const colorBlack = Color.fromARGB(255, 40, 40, 40);
const colorOrange = Colors.orangeAccent;
const colorBlue = Colors.blueAccent;
const colorWhite = Colors.white;

class ButtonNumbers extends StatelessWidget {
  ButtonNumbers(
      {required this.label,
      required this.onTap,
      required this.size,
      this.backgroundColor = colorOrange,
      this.labelColor = colorWhite});

  final String label;
  final VoidCallback onTap;
  final double size;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: backgroundColor as Color,
                    offset: Offset(1, 1),
                    blurRadius: 2),
              ],
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              color: backgroundColor),
          child: TextButton(
            onPressed: onTap,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
            child: Center(
                child: Text(
              label,
              style: TextStyle(fontSize: 24, color: labelColor),
            )),
          ),

          // Label text and other stuff here
        ));
  }
}

Widget getButtonNumbers(
    {required String text,
    required VoidCallback onTap,
    Color backgroundColor = colorOrange,
    Color textColor = colorWhite}) {
  return ButtonNumbers(
    label: text,
    onTap: onTap,
    size: 90,
    backgroundColor: backgroundColor,
    labelColor: textColor,
  );
}

class ButtonOperations extends StatelessWidget {
  ButtonOperations(
      {required this.label,
      required this.onTap,
      required this.size,
      this.backgroundColor = colorBlue,
      this.labelColor = colorBlack});

  final String label;
  final VoidCallback onTap;
  final double size;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: backgroundColor as Color,
                  offset: Offset(1, 1),
                  blurRadius: 2),
            ],
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            color: backgroundColor),
        child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
          child: Center(
              child: Text(
            label,
            style: TextStyle(color: labelColor, fontSize: 24),
          )),
        ),
      ),

      // Label text and other stuff here
    );
  }
}

Widget getButtonOperation(
    {required String text,
    required VoidCallback onTap,
    Color backgroundColor = colorBlue,
    Color textColor = colorBlack}) {
  return ButtonOperations(
    label: text,
    onTap: onTap,
    size: 90,
    backgroundColor: backgroundColor,
    labelColor: textColor,
  );
}

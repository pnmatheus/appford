import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;

  const Button({
    Key key,
    @required this.size,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: FlatButton(
        padding: EdgeInsets.all(10),
        color: color,
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              color: textColor,
            )),
      ),
    );
  }
}

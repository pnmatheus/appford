import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    @required this.size,
    this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: size.width * 0.8,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: Color.fromRGBO(196, 196, 196, 50),
      ),
      child: child,
    );
  }
}

import 'package:appford/components/power_by.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.size,
    this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.width * 0.3,
            child: Row(
              children: [
                Text(
                  'Future',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'assets/fonts/NotoSans-Bold.ttf',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manual',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'assets/fonts/NotoSans-Bold.ttf',
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.width * 0.4,
            child: Text(
              'Entre ou Cadastre-se para o Futuro.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'assets/fonts/NotoSans-Regular.ttf',
                fontSize: 14,
              ),
            ),
          ),
          child,
          PowerBy(size: size),
        ],
      ),
    );
  }
}

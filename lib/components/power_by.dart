import 'package:flutter/material.dart';

class PowerBy extends StatelessWidget {
  const PowerBy({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: size.width * 0.8,
          child: Text(
            'Powered by FT Development ©',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/fordLogo.png',
                  scale: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/logoFT.png',
                  scale: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/fiapLogo.png',
                  scale: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

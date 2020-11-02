import 'package:appford/Screens/ImageInput/body.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture uma foto do painel'),
      ),
      body: Body(),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:appford/Screens/ImageInput/components/problem_desc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  final picker = ImagePicker();
  String url;

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: double.infinity,
      maxWidth: double.infinity,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //print(pickedFile.path);
        uploadImage(pickedFile);
      } else {
        print('Nenhuma foto selecionada');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: double.infinity,
      maxWidth: double.infinity,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //print(pickedFile.path);
        uploadImage(pickedFile);
      } else {
        print('Nenhuma foto selecionada');
      }
    });
  }

  Future uploadImage(PickedFile pickedFile) async {
    String fileName = basename(pickedFile.path);
    final ref =
        FirebaseStorage.instance.ref().child('pictures').child(fileName);
    print(fileName);

    await ref.putFile(_image).onComplete;
    url = await ref.getDownloadURL();
    print(url);

    setState(() {
      print('uploaded');
    });
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color.fromRGBO(188, 136, 227, 70),
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: Color(0x00000000),
      children: [
        // FAB 1
        SpeedDialChild(
          child: Icon(Icons.image),
          backgroundColor: Color.fromRGBO(188, 136, 227, 70),
          onTap: () {
            //_image = null;
            getImageFromGallery();
          },
          label: 'Selecionar imagem',
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
          labelBackgroundColor: Color.fromRGBO(188, 136, 227, 70),
        ),
        // FAB 2
        SpeedDialChild(
          child: Icon(Icons.add_a_photo),
          backgroundColor: Color.fromRGBO(188, 136, 227, 70),
          onTap: () {
            //_image = null;
            getImage();
          },
          label: 'Capturar imagem',
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
          labelBackgroundColor: Color.fromRGBO(188, 136, 227, 70),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _image == null
          ? Center(child: Text('Nenhuma foto selecionada'))
          : ProblemDesc(
              size: size,
              url: url,
            ),
      // Container(
      //     alignment: Alignment.topCenter,
      //     height: 250,
      //     width: size.width,
      //     decoration: BoxDecoration(
      //       color: Colors.grey,
      //     ),
      //     child: Image.network(url.toString()),
      //   ),
      floatingActionButton: _getFAB(),
    );
  }
}

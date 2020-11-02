import 'package:appford/Screens/ImageInput/image_input.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _models = ['Ka', 'Fiesta'];
  var _age = ['2018', '2019', '2020', '2021'];
  var _selectedModel;

  void _selectModel(String model) {
    setState(() {
      this._selectedModel = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Background(
        size: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: DropdownButtonFormField(
                dropdownColor: Colors.grey,
                icon: Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ),
                hint: Center(
                  child: Text(
                    'Selecione o modelo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.directions_car,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(196, 196, 196, 50),
                  filled: true,
                ),
                items: _models.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: _selectModel,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: DropdownButtonFormField(
                dropdownColor: Colors.grey,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                hint: Text(
                  'Ano',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(196, 196, 196, 50),
                  filled: true,
                ),
                items: _age.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageInput(),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: size.height * 0.03,
              width: size.width * 0.8,
              child: Row(
                children: <Widget>[
                  Text(
                    'Não sabe qual é o seu modelo?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      ' Ajuda.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

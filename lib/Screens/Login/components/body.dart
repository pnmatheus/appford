import 'package:appford/Screens/ModelChoice/model_choice.dart';
import 'package:appford/components/button.dart';
import 'package:appford/components/text_field_container.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Background(
        size: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldContainer(
              size: size,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintText: 'Seu usuário ou e-mail...',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            PasswordTextField(
              size: size,
              onChanged: (value) {},
            ),
            Container(
              height: size.height * 0.03,
              width: size.width * 0.8,
              child: Row(
                children: <Widget>[
                  Text(
                    'Esqueceu sua senha?',
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
            Button(
              size: size,
              text: 'Login',
              color: Color.fromRGBO(188, 136, 227, 70),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModelChoice(),
                  ),
                );
              },
            ),
            Button(
              size: size,
              text: 'Primeiro Login? Crie sua conta',
              color: Color.fromRGBO(152, 216, 226, 70),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordTextField({
    Key key,
    @required this.size,
    this.onChanged,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: Center(
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Senha...',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

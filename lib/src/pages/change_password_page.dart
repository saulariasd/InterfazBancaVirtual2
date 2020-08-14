import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff37B0A9),
      body: Center(
        child: Container(
          width: size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _createTitle(),
              _createField('Contraseña Actual', TextInputType.text, true),
              _createField('Nueva Contraseña', TextInputType.text, true),
              _createField('Repetir Contraseña', TextInputType.text, true),
              SizedBox(height: 30),
              _createButton(context)
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton _createButton(BuildContext context) {
    return RaisedButton(
      color: Color(0xff2D6A67),
      child: Text(
        'Confirmar',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Container _createTitle() {
    return Container(
      child: Text('Actualizar contraseña'),
    );
  }

  Widget _createField(String text, TextInputType type, bool obscure) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(color: Colors.white),
        keyboardType: type,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

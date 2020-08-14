import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff37B0A9),
      body: _createBody(size, context),
    );
  }

  Widget _createBody(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
              height: 500,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _createHeader(),
                  _createForm(size, context),
                  _createFooter(),
                ],
              ))),
    );
  }

  Column _createFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('No tienes una cuenta?'),
        Text('Acércate a nuestras Instalaciones y te ayudaremos'),
      ],
    );
  }

  Container _createForm(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.80,
      child: Form(
        child: Column(
          children: [
            _createField('Correo', TextInputType.emailAddress, false),
            _createField('Contraseña', TextInputType.text, true),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.lock),
                FlatButton(
                  child: Text('Olvidé mi contraseña'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'recover');
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            RaisedButton(
              color: Color(0xff2D6A67),
              child: Text('INICIAR SESIÓN'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'tabs');
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField _createField(String text, TextInputType type, bool obscure) {
    return TextFormField(
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
    );
  }

  Column _createHeader() {
    return Column(
      children: [
        Container(
          child: Image.asset('assets/logo.png'),
        ),
        SizedBox(height: 20),
        Text(
          'ACCESO AL SISTEMA TRANSACCIONAL',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

import 'package:appdis/src/pages/change_password_page.dart';
import 'package:appdis/src/pages/credit_page.dart';
import 'package:appdis/src/pages/home_page.dart';
import 'package:appdis/src/pages/login_page.dart';
import 'package:appdis/src/pages/recover_password_page.dart';
import 'package:appdis/src/pages/tabs_page.dart';
import 'package:appdis/src/pages/transfer_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'tabs': (BuildContext context) => TabsPage(),
        'home': (BuildContext context) => HomePage(),
        'credit': (BuildContext context) => CreditPage(),
        'transfer': (BuildContext context) => TransferPage(),
        'recover': (BuildContext context) => RecoverPasswordPage(),
        'change': (BuildContext context) => ChangePasswordPage(),
      },
    );
  }
}

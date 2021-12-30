import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  final Color _primaryColor =  HexColor('#DC54FE');
  final Color _accentColor = HexColor('#8A02AE');
  LoginUiApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor:Colors.grey.shade100,
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(title: 'Flutter Login UI'),
    );
  }
}


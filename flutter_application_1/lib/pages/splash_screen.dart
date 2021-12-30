import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;

  _SplashScreenState(){

    Timer(const Duration(milliseconds: 2000),(){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
      });

    });

    Timer(
      Duration(milliseconds: 50),(){
        setState(() {
          _isVisible = true;
        });
      }
      );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      // ignore: unnecessary_new
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,

        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: const Center(
              child: ClipOval(
                child: Icon(Icons.widgets,size: 100),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2.0,
                  offset: const Offset(5.0, 3.0),
                  spreadRadius: 2.0,
                )
              ]
            ),
          ),
        )
      ),
    );


  }
}

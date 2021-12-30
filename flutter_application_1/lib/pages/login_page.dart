

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/theme_helper.dart';
import 'package:flutter_application_1/pages/forgot_password_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:flutter_application_1/pages/widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}):super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight,true, Icons.login_rounded),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Merhaba',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Hesabınıza giriş yapın.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          decoration: ThemeHelper().textInputDecoration('Kullanıcı Adı','Kullanıcı adınızı giriniz.'),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration('Şifre','Şifrenizi giriniz.'),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                              margin: EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Şifremi unuttum", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                        Container(
                          
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('GİRİŞ Yap'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          //child: Text('Hesabım yok kaydol'),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Hesabım yok? '),
                                TextSpan(
                                  text: 'Kaydol',
                                  recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),
                                ),
                              ]
                            ),
                          ),
                        
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],),
      ),
    );
  }

}
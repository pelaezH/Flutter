import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/sing_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        "login": (context) => LoginPage(),
        "singup": (context) => SingUpPage()
      },
    );
  }
}

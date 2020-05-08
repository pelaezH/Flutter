import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../widgets/circle.dart';
import '../widgets/imput_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() {
    _formkey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -size.width * .22,
                top: -size.width * .36,
                child: Circle(
                  radius: size.width * 0.45,
                  colors: [Colors.pink, Colors.pinkAccent],
                ),
              ),
              Positioned(
                left: -size.width * .15,
                top: -size.width * .34,
                child: Circle(
                  radius: size.width * 0.35,
                  colors: [Colors.orange, Colors.deepOrange],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(top: size.width * 0.25),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 25)
                                  ]),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Hello again \n Welcome back",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 300, minWidth: 300),
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  children: <Widget>[
                                    InputText(
                                        label: "EMAIL ADDRESS",
                                        inputType: TextInputType.emailAddress,
                                        validator: (String text) {
                                          if (text.contains("@")) {
                                            return null;
                                          }
                                          return "Invalid Email";
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InputText(
                                      label: "PASSWORD",
                                      isSecure: true,
                                      validator: (String text) {
                                        if (text.isNotEmpty &&
                                            text.length > 5) {
                                          return null;
                                        }
                                        return "Invalid Password";
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 300, minWidth: 300),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                borderRadius: BorderRadius.circular(4),
                                child: Text(
                                  "Sing In",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () => _submit(),
                                color: Colors.pink,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("New to Friendly Desi?",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54)),
                                CupertinoButton(
                                    child: Text(
                                      "Sing Up",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.pinkAccent),
                                    ),
                                    onPressed: () =>
                                        Navigator.pushNamed(context, "singup"))
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

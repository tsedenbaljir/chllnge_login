import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';

var _email = "";
var _password = "";

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  void email(e) {
    _email = e;
    debugPrint(e);
  }

  @override
  void password(e) {
    _password = e;
    debugPrint(e);
  }

  @override
  Future<http.Response> register() async {
    await http.post('http://192.168.1.100:8080/api/users/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'email': _email, "password": _password}));
    // if(user != null){

    // debugPrint("${user}");
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password(value);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                register();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

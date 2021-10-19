// ignore_for_file: avoid_print, prefer_const_constructors

import 'register.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Api api = Api();
  _login() {
    api.login('modahh@gmail', '123456').then((value) {
      print(value);
      if (value == 'token') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('LOGIN'),
          onPressed: _login,
        ),
      ),
      floatingActionButton: FloatingActionButton(
         
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterPage()));
        },
        child: Text('Reg.'),
      ),
    );
  }
}

// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'api.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Api api = Api();
  _register()  {
     api.register('abcd', 'ofghtt7uugg@gmail.com', '123456', '123456').then((value) {
      print(value);
      if (value.toString().contains('token')) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
            ElevatedButton(
              child: const Text('Register'),
              onPressed: _register,
            ),  
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
        },
        child: Text('Login'),
      ),
    );
  }
}

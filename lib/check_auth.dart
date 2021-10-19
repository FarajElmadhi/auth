// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'home.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

    void _checkIfLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: isAuth ? HomePage():LoginPage(),
    );
  }
}
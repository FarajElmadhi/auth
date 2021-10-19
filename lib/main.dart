// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

Future<void> main() async {
      // WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      print(token);
      runApp(MaterialApp(home: token == null ? LoginPage() : HomePage()));
    }



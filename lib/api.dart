import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String serverUrl = "https://???.com/sms/sms/public/api";

  saveToCash(String k, String v) async {
    final prefs = await SharedPreferences.getInstance();
    String key = k;
    String value = v;
    prefs.setString(key, value);
  }

 Future<String> login(String email, String password) async {
    String myUrl = "$serverUrl/login";

    final response = await http.post(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json'},
      body: {"email": email, "password": password},
    );

    var data = json.decode(response.body);
    
    if (response.body.contains('error')) {
      return 'error';
    } else {
      String token = data["token"].toString();
      await saveToCash('token', token);
      return 'token';
    }
  }

  register(String name, String email, String password, String cPassword) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(Uri.parse(myUrl), body: {
      "name": name,
      "email": email,
      "password": password,
      "c_password": cPassword
    });

    var data = json.decode(response.body);
    List val = [];

    if (response.body.contains('error')) {
      var eEmail = data["error"]["email"];
      var ePass = data["error"]["password"];
      var eCpass = data["error"]["c_password"];
      var eName = data["error"]["name"];

      val.add({
        'message': 'error',
        'eName': eName,
        'eEmail': eEmail,
        'ePass': ePass,
        'eCpass': eCpass
      });
    } else {
      String token = data["success"]['token'].toString();
      await saveToCash('token', token);

      val.add({
        'message': 'success',
        'token': token,
        'name': data["success"]['name'].toString()
      });
    }
    return val;
  }



Future<bool> logout()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            return  true;
} 

}



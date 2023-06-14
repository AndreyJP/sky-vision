import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_vision/model/user.dart';

/*
  Dados para teste de login
  "email": "george.bluth@reqres.in",
  "password": "master"
*/

class UserController{
  static final UserController instance = UserController();
  static const request = 'https://reqres.in/api/login';

  Future<bool> login(String email, String passwd) async{

    http.Response response = await http.post(
      Uri.parse(request),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": email,
        "password": passwd,
      }),
    );

    if(response.statusCode == 200){
      User.instance.setEmail(email);
      User.instance.setPassword(passwd);
      //print(jsonDecode(response.body)['token']);
      return true;
    }else{
      //print(jsonDecode(response.body)['error']);
      return false;
    }
  }
}
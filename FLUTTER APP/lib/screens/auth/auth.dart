import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rive_animation/main.dart';
import 'package:rive_animation/model/user.dart';
import 'package:rive_animation/screens/auth/error_handling.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print("success");
        },
      );
    } catch (e) {
      print("faillllll");
      //showSnackBar(context, e.toString());
    }
  }
}

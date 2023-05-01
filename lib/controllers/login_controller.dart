import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recruitment_division_automation/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool isLogined = false;
  var userInfo = LoginModel();
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void changeVisibility() {
    obscureText = !obscureText;
    update();
  }

  Future<dynamic> getUserInfo(String password, String email) async {
    try {
      final response = await Dio().post('http://127.0.0.1:8000/api/auth/login',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'password': password, 'email': email});
      if (response.statusCode == 200 && response.data != '') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        userInfo = LoginModel.fromJson(response.data);
        prefs.setString('token', userInfo.accessToken ?? '');
        isLogined = true;
        update();
        return isLogined;
      }
    } catch (error) {
      update();
      return isLogined;
    }
  }

}

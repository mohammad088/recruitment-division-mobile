import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  String link = 'http://10.0.2.2:8000';
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
      final response = await Dio().post('$link/api/auth/login',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'password': password, 'email': email});
      if (response.statusCode == 200 && response.data != '') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        userInfo = LoginModel.fromJson(response.data);
        prefs.setString('token', userInfo.accessToken ?? '');
        prefs.setInt('user_id', userInfo.user!.id!);
        prefs.setInt('role', userInfo.user!.role!);
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

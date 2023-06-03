import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/register_model.dart';

class RegisterController extends GetxController {
  String link = 'http://10.0.2.2:8000';
  bool isRegistered = false;
  RegisterModel register = RegisterModel();
  String message = '';
  bool obscureText = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void changeVisibility() {
    obscureText = !obscureText;
    update();
  }

  Future<dynamic> registeration(
      String name, String password, String email) async {
    try {
      final response = await Dio().post(
          '$link/api/auth/register',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'name': name, 'password': password, 'email': email});
      if (response.statusCode == 201 && response.data != '') {
        register = RegisterModel.fromJson(response.data);
        message = register.message ?? '';
        isRegistered = true;
        update();
      }
    } catch (error) {
      message = 'الحساب موجود مسبقا';
      isRegistered = false;
      update();
    }
  }
}

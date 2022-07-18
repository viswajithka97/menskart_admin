import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/authentication_controller/authentication_services/authentication_services.dart';
import 'package:menskart_admin/model/authentication_model/login_model.dart';
import 'package:menskart_admin/model/authentication_model/logout_model.dart';
import 'package:menskart_admin/view/dashboard_page/dashboard_page.dart';
import 'package:menskart_admin/view/login_page/login_page.dart';

class AuthenticationController extends GetxController {
  login(String email, String password) async {
    if (email == 'asifsaheer7034@gmail.com' && password == '1234') {
      Map<String, dynamic> login = {"email": email, "password": password};
      try {
        final response = await AuthenticationServices().loginCheck(login);
      
        if (response!.statusCode == 200 || response.statusCode == 201) {
          final data = adminLoginModelFromJson(response.data);
          if (data.login) {
            Get.offAll(() => const DashBoardPage());
          } else {
            Get.snackbar('Login Failed', 'Invalid Email or Password',
                snackPosition: SnackPosition.BOTTOM);
          }
        }
      } catch (e) {
        Get.snackbar('', '$e',
            backgroundColor: Colors.red,
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Invalid Admin', 'No Admin Found',
          colorText: Colors.red,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  logout() async {
    try {
      final response = await AuthenticationServices().logout();

      if (response!.statusCode == 200) {
        final data = adminLogoutModelFromJson(response.data);

        if (data.login) {
          Get.offAll(const LoginPage());
          Get.snackbar('Success', 'Admin has successfully logged out',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      Get.snackbar('', '$e',
          backgroundColor: Colors.red,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

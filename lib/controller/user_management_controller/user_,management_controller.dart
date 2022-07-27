import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/user_management_controller/user_services/user_services.dart';
import 'package:menskart_admin/model/user_management_model/block_user_model.dart';
import 'package:menskart_admin/model/user_management_model/delete_user_model.dart';
import 'package:menskart_admin/model/user_management_model/get_all_user_model.dart';

class UserController extends GetxController {
  List<User>? users;
  getAllUsers() async {
    try {
      final response = await UserServices().getUsers();
      log(response!.data);
      if (response.statusCode == 200) {
        final data = getAllUsersModelFromJson(response.data);
        users = data.users.obs;

        update();
      }
    } catch (e) {
      log("------------CATCHED ERROR-------$e----------");
    }
  }

  deleteUser(String userId) async {
    try {
      final response = await UserServices().deleteUser(userId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = deleteUserModelFromJson(response.data);
        if (data.success) {
          Get.snackbar('Success', 'User Deleted Successfully',
              backgroundColor: Colors.green);
          update();
        } else {
          Get.snackbar('Error', 'User Not Deleted');
        }
        update();
      }
    } catch (e) {
      log("------------$e");
    }
  }

  blockUser(String userId) async {
    try {
      final response = await UserServices().blockUser(userId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = blockUserModelFromJson(response.data);
        if (data.success) {
          Get.snackbar('Success', 'User Blocked Successfully',
              backgroundColor: Colors.green);
          update();
        } else {
          Get.snackbar('Error', 'User Not Blocked');
        }
        update();
      }
    } catch (e) {
      log("------------$e");
    }
  }

  unblockUser(String userId) async {
    try {
      final response = await UserServices().unBlockUser(userId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = blockUserModelFromJson(response.data);
        if (data.success) {
          Get.snackbar('Success', 'User Unblocked Successfully',
              backgroundColor: Colors.green);
          update();
        } else {
          Get.snackbar('Error', 'User Not Unblocked');
        }
        update();
      }
    } catch (e) {
      log("------------$e");
    }
  }

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }
}

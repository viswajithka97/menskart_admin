import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/order_controller/order_servies/order_services.dart';
import 'package:menskart_admin/model/order_model/get_all_orders_model.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

class OrderController extends GetxController {
  List<Order>? orders;
  getAllOrders() async {
    try {
      final response = await OrderServices().getAllUsers();
      log(response!.data);
      if (response.statusCode == 200) {
        final data = getAllOrdersModelFromJson(response.data);

        orders = data.orders.obs;
        update();
      }
    } catch (e) {
      log("message ==========error========== $e");
    }
  }

  deliveryStatusCheck(String status) {
    if (status == "pending") {
      return Colors.orange;
    } else if (status == "canceled") {
      return Colors.red;
    } else if (status == "Delived") {
      return kGreen;
    } else {
      return Colors.grey;
    }
  }

  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }
}

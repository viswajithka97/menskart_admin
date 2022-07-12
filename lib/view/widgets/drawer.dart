import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/authentication_controller/authentication_controller.dart';
import 'package:menskart_admin/view/categories_list_page/categories_list_page.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/coupon_page/coupon_page.dart';
import 'package:menskart_admin/view/dashboard_page/dashboard_page.dart';
import 'package:menskart_admin/view/login_page/login_page.dart';
import 'package:menskart_admin/view/orders_list_page/orders_list_page.dart';
import 'package:menskart_admin/view/products_list_page/products_list_page.dart';
import 'package:menskart_admin/view/user_management_page/user_management_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBlack,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kWhite))),
            child: Center(
              child: Text(
                'Welcome Admin',
                style: TextStyle(color: kWhite, fontSize: 30),
              ),
            ),
          ),
          ListTile(
            title: const Text('Dashboard',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const DashBoardPage());
            },
          ),
          ListTile(
            title: const Text('Products',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const ProductListPage());
            },
          ),
          ListTile(
            title: const Text('User Management',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const UserManagementPage());
            },
          ),
          ListTile(
            title: const Text('Categories',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const CategoriesListPage());
            },
          ),
          ListTile(
            title: const Text('Orders',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const OrdersListPage());
            },
          ),
          ListTile(
            title: const Text('View Coupon',
                style: TextStyle(color: kWhite, fontSize: 20)),
            onTap: () {
              Get.offAll(const CouponPage());
            },
          ),
          const Spacer(),
          GetBuilder<AuthenticationController>(
            init: AuthenticationController(),
            builder: (controller) {
              return ListTile(
                title: const Text('Logout',
                    style: TextStyle(color: kWhite, fontSize: 20)),
                onTap: () {
                 controller.logout();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

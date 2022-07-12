import 'package:flutter/material.dart';
import 'package:menskart_admin/view/widgets/drawer.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Coupon'),
      ),
      body:const SafeArea(
        child: Center(
          child: Text('Product'),
        ),
      ),
    );
  }
}

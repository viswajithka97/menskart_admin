import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/orders_list_page/widgets/order_page_container_widget.dart';

import 'package:menskart_admin/view/widgets/drawer.dart';

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:const [
              kHeight10,
              OrderPageContainerWidget()
            ],
          ),
        ),
      ),
    );
  }
}


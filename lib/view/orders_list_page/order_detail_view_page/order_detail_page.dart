import 'package:flutter/material.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/orders_list_page/order_detail_view_page/widgets/order_detail_text_widget.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:  [
              kHeight20,
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundGrey,
                  borderRadius: kBRadius10
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      OrderDetailTextWidget(heading: 'Ordered User', value: 'Viswajith K A'),
                      kHeight10,
                      OrderDetailTextWidget(heading: 'Ordered Date', value: '06/06/2022'),
                      kHeight10,
                      OrderDetailTextWidget(heading: 'Delivery Address', value: 'House no 12, Thammadiyil Temple Road\n   Tripunitura'),
                      kHeight10,
                      OrderDetailTextWidget(heading: 'Payment Mode', value: 'Online'),
                      kHeight10,
                      OrderDetailTextWidget(heading: 'Payment Status', value: 'Sucessful'),
                      kHeight10,
                      OrderDetailTextWidget(heading: 'Total Amount', value: '2240'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

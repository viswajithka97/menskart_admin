import 'package:flutter/material.dart';
import 'package:menskart_admin/model/order_model/get_all_orders_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/orders_list_page/order_detail_view_page/widgets/order_detail_text_widget.dart';

class OrderDetailPage extends StatelessWidget {
  final Order orders;
  const OrderDetailPage({Key? key, required this.orders}) : super(key: key);

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
            children: [
              kHeight20,
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kBackgroundGrey, borderRadius: kBRadius10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orders.user == null
                          ? const OrderDetailTextWidget(
                              heading: 'Ordered User', value: "No Name")
                          : OrderDetailTextWidget(
                              heading: 'Ordered User',
                              value: orders.user.toString()),
                      kHeight10,
                      OrderDetailTextWidget(
                          heading: 'Ordered Date', value: orders.orderDate),
                      kHeight10,
                      orders.deliveryDetails == null
                          ? const OrderDetailTextWidget(
                              heading: 'Delivery Address', value: 'No Address')
                          : OrderDetailTextWidget(
                              heading: 'Delivery Address',
                              value:
                                  'House no ${orders.deliveryDetails!.houseNo}, ${orders.deliveryDetails!.address}\n   ${orders.deliveryDetails!.city}, ${orders.deliveryDetails!.state}, ${orders.deliveryDetails!.pincode}'),
                      kHeight10,
                      OrderDetailTextWidget(
                          heading: 'Payment Mode',
                          value: orders.paymentMethode),
                      kHeight10,
                      OrderDetailTextWidget(
                          heading: 'Payment Status', value: orders.payment),
                      kHeight10,
                      OrderDetailTextWidget(
                          heading: 'Total Amount',
                          value: "₹ ${orders.totalAmount}"),
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

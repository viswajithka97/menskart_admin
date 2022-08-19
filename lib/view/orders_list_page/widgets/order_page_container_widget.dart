import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/order_controller/order_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/orders_list_page/order_detail_view_page/order_detail_page.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';

class OrderPageContainerWidget extends StatelessWidget {
  const OrderPageContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        if (controller.orders == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
            separatorBuilder: (context, index) {
              return kHeight10;
            },
            itemCount: controller.orders!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final orders = controller.orders![index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => OrderDetailPage(orders: orders));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kBackgroundGrey, borderRadius: kBRadius10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        orders.user == null
                            ? const Text(
                                "User Name",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            : Text(
                                orders.user.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                        ContainerConfirmButton(
                          height: 25,
                          width: 65,
                          radius: kBRadius5,
                          buttonText: orders.status,
                          buttonColor: controller
                              .deliveryStatusCheck(orders.status.toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return kHeight10;
          },
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>const OrderDetailPage());
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
                      const Text(
                        'Viswajith K A',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ContainerConfirmButton(
                        height: 25,
                        width: 65,
                        radius: kBRadius5,
                        buttonText: 'Delivered',
                        buttonColor: kLightGreen,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

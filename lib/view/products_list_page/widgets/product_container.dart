import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/core/url_constants.dart';
import 'package:menskart_admin/view/products_list_page/edit_products_page/edit_product_page.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return controller.products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                shrinkWrap: true,
                itemCount: controller.products.length,
                separatorBuilder: (context, index) => kHeight10,
                itemBuilder: (context, index) {
                  // print(controller.products[0].description);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: kBRadius15, color: kConBagColor),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: kBRadius10,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '$kProductUrl/${controller.products[index].id}.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  height: 150,
                                  width: 210,
                                  // color: kBlack,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: Text(
                                          controller
                                              .products[index].description,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      kHeight5,
                                      controller.products[index].offerPrice ==
                                              null
                                          ? Text(
                                              '₹ ${controller.products[index].orginalPrice}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          : Text(
                                              '₹ ${controller.products[index].offerPrice}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                      kHeight5,
                                      Text(
                                        controller.products[index].brand,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      kHeight5,
                                      Row(
                                        children: [
                                          ContainerConfirmButton(
                                            height: 38,
                                            width: 100,
                                            containerIcon: Icons.edit,
                                            radius: kBRadius30,
                                            buttonText: 'Edit',
                                            onpressed: const EditProductPage(),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 182, 120, 117),
                                                size: 24,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
      },
    );
  }
}

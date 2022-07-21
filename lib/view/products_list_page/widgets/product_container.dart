import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
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
  ProductContainer({
    Key? key,
  }) : super(key: key);
  String baseImageUrl = kProductUrl;

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
                                  child: CachedNetworkImage(
                                    height: 140,
                                    width: 140,
                                    imageUrl:
                                        '$baseImageUrl/${controller.products[index].id}.jpg',
                                    placeholder: (context, url) =>
                                        const SizedBox(
                                            height: 50,
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) {
                                      return CachedNetworkImage(
                                        height: 140,
                                        width: 140,
                                        imageUrl:
                                            '$kProductAddedUrl/${controller.products[index].id}.jpg',
                                        placeholder: (context, url) =>
                                            const SizedBox(
                                                height: 70,
                                                child:
                                                    CircularProgressIndicator()),
                                      );
                                    },
                                  )
                                  //  Container(
                                  //   height: 140,
                                  //   width: 140,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: kBRadius10,
                                  //       image: DecorationImage(
                                  //           image: NetworkImage(
                                  //               '$baseImageUrl/${controller.products[index].id}.jpg'),
                                  //           onError: (
                                  //             context,
                                  //             error,
                                  //           ) {
                                  //             print('eerrprrr');

                                  //             controller.update();
                                  //           },
                                  //           fit: BoxFit.cover)),
                                  // ),
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
                                            onpressed: () {
                                              Get.to(EditProductPage(
                                                  index: index));
                                            },
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                controller.deleteProduct(
                                                    controller
                                                        .products[index].id);
                                                controller.update();

                                                // controller.getProducts();
                                              },
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

  // void makeImages(ProductController controller) {
  //   for(var e in controller.products){

  //   }
  // }
}

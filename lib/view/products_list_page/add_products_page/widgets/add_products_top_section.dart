import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';

class AddProductsTopSection extends StatelessWidget {
  const AddProductsTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const HeadingText(headingText: 'Add Image'),
            kHeight10,
            Center(
                child: Container(
                    height: 170,
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width * 0.7,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack, width: 1),
                        image: controller.imagefile1 == null
                            ? const DecorationImage(
                                image: AssetImage('assets/images/download.png'),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: FileImage(controller.imagefile1!),
                                fit: BoxFit.cover),
                        borderRadius: kBRadius10))),
            // kHeight20,
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    controller.selectImage1();
                  },
                  child: const Text("Select Image 1")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlack, width: 1),
                        image: controller.imagefile2 == null
                            ? const DecorationImage(
                                image: AssetImage('assets/images/download.png'),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: FileImage(controller.imagefile2!),
                                fit: BoxFit.cover),
                        borderRadius: kBRadius10,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.selectImage2();
                          },
                          child: const Text("Select Image 2")),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: kBlack, width: 1),
                          image: controller.imagefile3 == null
                              ? const DecorationImage(
                                  image:
                                      AssetImage('assets/images/download.png'),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: FileImage(controller.imagefile3!),
                                  fit: BoxFit.cover),
                          borderRadius: kBRadius10),
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.selectImage3();
                          },
                          child: const Text("Select Image 3")),
                    ),
                  ],
                ),
              ],
            ),
            kHeight10,
          ],
        );
      },
    );
  }
}

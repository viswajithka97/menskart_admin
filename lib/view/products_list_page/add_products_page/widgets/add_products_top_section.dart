import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

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
            const HeadingText(headingText: 'Add Image'),
            kHeight10,
            Center(
              child: Container(
                height: 250,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    image: controller.imagefile1 == null
                        ? const DecorationImage(
                            image: AssetImage('assets/images/download.jpg'),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: FileImage(controller.imagefile1!)),
                    borderRadius: kBRadius10),
                child: GestureDetector(
                  onTap: () async {
                    controller.selectImage1();
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration:
                        BoxDecoration(borderRadius: kBRadius30, color: kWhite),
                    child: const Center(
                      child: Text(
                        'Add Image',
                        style: TextStyle(color: kBlack, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            kHeight20,
            SizedBox(
              // color: kBlack,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectImage2();
                    },
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(color: kBlack, width: 1),
                            borderRadius: kBRadius10,
                            color: kWhite),
                        child: const Center(
                          child: Text(
                            'Select Image',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                  Container(
                      color: kGreen,
                      height: 40,
                      width: 250,
                      child: Center(
                          child: controller.imagefile2 == null
                              ? const Text('Select an Image',
                                  maxLines: 1, style: TextStyle(fontSize: 20))
                              : Text(controller.imagefile2.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 20)))),
                ],
              ),
            ),
            kHeight10,
            SizedBox(
              // color: kBlack,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectImage3();
                    },
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(color: kBlack, width: 1),
                            borderRadius: kBRadius10,
                            color: kWhite),
                        child: const Center(
                          child: Text(
                            'Select Image',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                  Container(
                      color: kGreen,
                      height: 40,
                      width: 250,
                      child: Center(
                          child: controller.imagefile3 == null
                              ? const Text('Select an Image',
                                  maxLines: 1, style: TextStyle(fontSize: 20))
                              : Text(controller.imagefile2.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 20)))),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

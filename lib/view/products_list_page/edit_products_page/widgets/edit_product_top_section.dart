import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/core/url_constants.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class EditProductTopSection extends StatelessWidget {
  final int index;
  const EditProductTopSection({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(headingText: 'Edit Image'),
            kHeight10,
            Center(
              child: GestureDetector(
                onTap: () {
                  controller.selectImage1();
                },
                child: controller.imagefile1 == null
                    ? CachedNetworkImage(
                        height: 140,
                        width: 140,
                        imageUrl:
                            '$kProductUrl/${controller.products[index].id}.jpg',
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          return CachedNetworkImage(
                              height: 140,
                              width: 140,
                              imageUrl:
                                  '$kProductAddedUrl/${controller.products[index].id}.jpg',
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) {
                                return Text('No Image');
                              });
                        })
                    : Container(
                        height: 250,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(controller.imagefile1!),
                                fit: BoxFit.cover),
                            borderRadius: kBRadius10),
                        child: Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: kBRadius30, color: kWhite),
                          child: const Center(
                            child: Text(
                              'Change Image',
                              style: TextStyle(color: kBlack, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            kHeight20,
            // SizedBox(
            //   // color: kBlack,
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           controller.selectImage2();
            //         },
            //         child: Container(
            //             height: 40,
            //             width: 110,
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: kBlack, width: 1),
            //                 borderRadius: kBRadius10,
            //                 color: kWhite),
            //             child: const Center(
            //               child: Text(
            //                 'Select Image',
            //                 style: TextStyle(fontSize: 20),
            //               ),
            //             )),
            //       ),
            //       Container(
            //           color: kGreen,
            //           height: 40,
            //           width: 250,
            //           child: Center(
            //               child: controller.imagefile2 == null
            //                   ? const Text('Select an Image',
            //                       maxLines: 1, style: TextStyle(fontSize: 20))
            //                   : Text(controller.imagefile2.toString(),
            //                       maxLines: 1,
            //                       style: const TextStyle(fontSize: 20)))),
            //     ],
            //   ),
            // ),
            // kHeight10,
            // SizedBox(
            //   // color: kBlack,
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           controller.selectImage3();
            //         },
            //         child: Container(
            //             height: 40,
            //             width: 110,
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: kBlack, width: 1),
            //                 borderRadius: kBRadius10,
            //                 color: kWhite),
            //             child: const Center(
            //               child: Text(
            //                 'Select Image',
            //                 style: TextStyle(fontSize: 20),
            //               ),
            //             )),
            //       ),
            //       Container(
            //           color: kGreen,
            //           height: 40,
            //           width: 250,
            //           child: const Center(
            //               child:
            //                   // controller.imagefile3 == null
            //                   // ?
            //                   Text('Select an Image',
            //                       maxLines: 1, style: TextStyle(fontSize: 20))
            //               // : Text(controller.imagefile2.toString(),
            //               //     maxLines: 1,
            //               //     style: const TextStyle(fontSize: 20))
            //               )),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

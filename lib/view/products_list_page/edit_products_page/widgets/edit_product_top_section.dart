import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
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
              child: controller.imagefile1 == null
                  ? CachedNetworkImage(
                      height: 140,
                      width: 140,
                      imageUrl:
                          '$kProductUrl/${controller.products[index].id}.jpg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                          height: 20,
                          child: Image.asset('assets/images/loading.png')),
                      errorWidget: (context, url, error) {
                        return CachedNetworkImage(
                            height: 140,
                            width: 140,
                            imageUrl:
                                '$kProductAddedUrl/${controller.products[index].id}.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SizedBox(
                                height: 20,
                                child:
                                    Image.asset('assets/images/loading.png')),
                            errorWidget: (context, url, error) {
                              return const Text('No Image');
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
                    ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.selectImage1();
                },
                child: const Text('Select Image 1'),
              ),
            ),
            kHeight20,
          ],
        );
      },
    );
  }
}

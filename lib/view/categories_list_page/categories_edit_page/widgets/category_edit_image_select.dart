import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/category_controller/category_controller.dart';
import 'package:menskart_admin/model/product_list_model/category_list_model.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class CategoryEditImageSelect extends StatelessWidget {
  final Category category;
  const CategoryEditImageSelect({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      initState: (_) {},
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.selectImage();
          },
          child: controller.categoryImage == null
              ? CachedNetworkImage(
                  imageUrl: '$kCategoryUrl/${category.id}.jpg',
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 125,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => const SizedBox(
                      height: 30, child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) {
                    return CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: '$kCategoryAddedUrl/${category.id}.jpg',
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 125,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const SizedBox(
                          height: 30, child: CircularProgressIndicator()),
                    );
                  },
                )
              : CircleAvatar(
                  radius: 125,
                  backgroundImage: FileImage(controller.categoryImage!),
                ),
        );
      },
    );
  }
}

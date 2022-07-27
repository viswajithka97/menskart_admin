import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/category_controller/category_controller.dart';

class AddCategoryImageSelect extends StatelessWidget {
  const AddCategoryImageSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.selectImage();
          },
          child: controller.categoryImage != null
              ? CircleAvatar(
                  radius: 125,
                  backgroundImage: FileImage(controller.categoryImage!),
                )
              : const CircleAvatar(
                  radius: 125,
                  backgroundImage: AssetImage('assets/images/download.jpg'),
                ),
        );
      },
    );
  }
}

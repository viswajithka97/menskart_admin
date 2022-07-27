import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/category_controller/category_controller.dart';
import 'package:menskart_admin/view/categories_list_page/categories_list_page.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';

class CategoryAddBottomSection extends StatelessWidget {
  CategoryAddBottomSection({Key? key}) : super(key: key);

  final TextEditingController categoryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextandFormFieldWidget(
          headingText: 'Category Name',
          hintText: 'Enter Your Category Name',
          controller: categoryNameController,
        ),
        kHeight20,
        GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return ContainerConfirmButton(
              height: 50,
              width: double.infinity,
              radius: kBRadius0,
              buttonText: 'Add Category',
              buttonColor: kYellow,
              onpressed: () {
                controller.addCategory(categoryNameController.text);
                Get.back();
              },
            );
          },
        )
      ],
    );
  }
}

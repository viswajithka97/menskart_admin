import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/category_controller/category_controller.dart';
import 'package:menskart_admin/model/product_list_model/category_list_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';

class CategoryEditBottomSection extends StatelessWidget {
  final Category category;
  const CategoryEditBottomSection({Key? key, required this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryNameController =
        TextEditingController(text: category.category);

    return Column(
      children: [
        TextandFormFieldWidget(
          headingText: 'Category Name',
          hintText: 'Category Name',
          controller: categoryNameController,
        ),
        kHeight20,
        GetBuilder<CategoryController>(
          init: CategoryController(),
          initState: (_) {},
          builder: (controller) {
            return ContainerConfirmButton(
              height: 50,
              width: double.infinity,
              radius: kBRadius0,
              buttonText: 'Apply Changes',
              buttonColor: kYellow,
              onpressed: () {
                controller.updateCategory(
                  categoryNameController.text,
                  category.id,
                );
                Get.back();
              },
            );
          },
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/categories_list_page/categories_list_page.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';

class CategoryAddBottomSection extends StatelessWidget {
  const CategoryAddBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       const TextandFormFieldWidget(
                  headingText: 'Category Name',
                  hintText: 'Enter Your Category Name'),
              kHeight20,
              ContainerConfirmButton(
                height: 50,
                width: double.infinity,
                radius: kBRadius0,
                buttonText: 'Add Category',
                buttonColor: kYellow,
                onpressed: const CategoriesListPage(),
              )
    ],);
  }
}
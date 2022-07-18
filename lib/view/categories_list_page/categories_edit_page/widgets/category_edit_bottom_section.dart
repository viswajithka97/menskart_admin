import 'package:flutter/cupertino.dart';

import 'package:menskart_admin/view/categories_list_page/categories_list_page.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';

class CategoryEditBottomSection extends StatelessWidget {
   CategoryEditBottomSection({Key? key}) : super(key: key);
final TextEditingController categoryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        TextandFormFieldWidget(
                  headingText: 'Category Name',
                  hintText: 'Jeans',controller: categoryNameController,),
              kHeight20,
              ContainerConfirmButton(
                height: 50,
                width: double.infinity,
                radius: kBRadius0,
                buttonText: 'Apply Changes',
                buttonColor: kYellow,
                onpressed: (){},
              )
    ],);
  }
}
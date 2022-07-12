import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/products_list_page.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class AddProductsDetailsSection extends StatelessWidget {
  const AddProductsDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
            const HeadingText(headingText: 'Add Details'),
            kHeight10,
            const TextandFormFieldWidget(
                headingText: 'Product Name', hintText: 'Product Name'),
            const TextandFormFieldWidget(
                headingText: 'Brand', hintText: 'Enter Product Brand'),
            const TextandFormFieldWidget(
                headingText: 'Category', hintText: 'Product Category'),
            const TextandFormFieldWidget(
                headingText: 'Price', hintText: 'Product Price'),
            const TextandFormFieldWidget(
                headingText: 'Offer Price', hintText: 'Offer Price'),
            const TextandFormFieldWidget(
                headingText: 'Offer Percentage', hintText: 'Offer Percentage'),
                kHeight10,
                ContainerConfirmButton(height: 50, width: double.infinity, radius: kBRadius0, buttonText: 'Save Changes',buttonColor: kYellow,onpressed: const ProductListPage(),)
      ],
    );
  }
}
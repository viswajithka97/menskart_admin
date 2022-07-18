import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/products_list_page.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class EditProductDetailSection extends StatelessWidget {
   EditProductDetailSection({Key? key}) : super(key: key);

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();

  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController offerPriceController = TextEditingController();
  final TextEditingController offerPercentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
            const HeadingText(headingText: 'Edit Details'),
            kHeight10,
         TextandFormFieldWidget(
          headingText: 'Product Name',
          hintText: 'Product Name',
          controller: productNameController,
        ),
        TextandFormFieldWidget(
          headingText: 'Brand',
          hintText: 'Enter Product Brand',
          controller: brandController,
        ),
        TextandFormFieldWidget(
          headingText: 'Category',
          hintText: 'Product Category',
          controller: categoryController,
        ),
        TextandFormFieldWidget(
          headingText: 'Price',
          hintText: 'Product Price',
          controller: priceController,
        ),
        TextandFormFieldWidget(
          headingText: 'Offer Price',
          hintText: 'Offer Price',
          controller: offerPriceController,
        ),
        TextandFormFieldWidget(
          headingText: 'Offer Percentage',
          hintText: 'Offer Percentage',
          controller: offerPercentController,
        ),
                kHeight10,
                ContainerConfirmButton(height: 50, width: double.infinity, radius: kBRadius0, buttonText: 'Save Changes',buttonColor: kYellow,onpressed: (){},)
      ],
    );
  }
}
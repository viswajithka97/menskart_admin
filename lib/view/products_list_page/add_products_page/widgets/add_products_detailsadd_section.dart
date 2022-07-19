import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/add_products_page/widgets/drop_down_widget.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class AddProductsDetailsSection extends StatelessWidget {
  AddProductsDetailsSection({Key? key}) : super(key: key);

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController offerPercentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText(headingText: 'Add Details'),
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
             DropdowmenuHomepage(),
            TextandFormFieldWidget(
              headingText: 'Price',
              hintText: 'Product Price',
              controller: priceController,
            ),
            TextandFormFieldWidget(
              headingText: 'Offer Percentage',
              hintText: 'Offer Percentage',
              controller: offerPercentController,
            ),
            kHeight10,
            ContainerConfirmButton(
              height: 50,
              width: double.infinity,
              radius: kBRadius0,
              buttonText: 'Save Changes',
              buttonColor: kYellow,
              onpressed: () {
                final productName = productNameController.text;
                final brand = brandController.text;
                final category = selectedvalue.toString();
                final price = priceController.text;

                final offerPercent = offerPercentController.text;
                print(category);

                controller.addProduct(
                    productName, brand, category, price, offerPercent);
              },
            )
          ],
        );
      },
    );
  }
}

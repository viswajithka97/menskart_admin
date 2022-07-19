import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/controller/product_controller/product_controller.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/products_list_page/add_products_page/widgets/drop_down_widget.dart';
import 'package:menskart_admin/view/products_list_page/edit_products_page/widgets/drop_down_edit_widget.dart';
import 'package:menskart_admin/view/products_list_page/widgets/container_confirm_button.dart';
import 'package:menskart_admin/view/products_list_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class EditProductDetailSection extends StatelessWidget {
  final int index;
  EditProductDetailSection({Key? key, required this.index}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController =
        TextEditingController(text: controller.products[index].description);
    final TextEditingController brandController =
        TextEditingController(text: controller.products[index].brand);
    final TextEditingController priceController =
        TextEditingController(text: controller.products[index].orginalPrice);
    final TextEditingController offerPercentController =
        TextEditingController(text: controller.products[index].offerpercentage);
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
          headingText: 'Price',
          hintText: 'Product Price',
          controller: priceController,
        ),
        DropdowmenuEditPage(index: index),
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
            final category = editvalue.toString();
            final price = priceController.text;
            final percentage = offerPercentController.text;
            final productId = controller.products[index].id;
            controller.updateProduct(
                productName, brand, category, price, percentage, productId);
            controller.getProducts();
            controller.update();
            // editvalue = null;

            print('cleared');
          },
        )
      ],
    );
  }
}

import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menskart_admin/controller/product_controller/product_services/product_services.dart';
import 'package:menskart_admin/model/product_list_model/product_list_model.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  final ImagePicker picker = ImagePicker();
  // late Response<dynamic> response;
  int? statusCode;

  File? imagefile1;
  File? imagefile2;
  File? imagefile3;

  getProducts() async {
    try {
      final response = await ProductServices().getProducts();
      log(response!.data.toString());
      statusCode = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = productListModelFromJson(response.data);
        // log(data.products.toString());
        products = data.products.obs;
        update();
      }
    } catch (e) {
      log('---------------------------this is-------$e');
    }
  }

  addProduct(
    String productName,
    String brand,
    String category,
    String price,
    String offerPercent,
  ) async {
    try {
      final response = await ProductServices().addProduct(productName, brand,
          category, price, offerPercent, imagefile1!, imagefile2!, imagefile3!);
      // log('=================${response!.statusCode}=================');
      print(response!.data.toString());
    } catch (e) {
      log('message:' '$e');
    }
  }

  selectImage1() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile1 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  selectImage2() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile2 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  selectImage3() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      imagefile3 = File(image.path);
      log("============${imagefile2.toString()}");
      update();
    }
  }

  @override
  void onInit() {
    getProducts();

    super.onInit();
  }
}

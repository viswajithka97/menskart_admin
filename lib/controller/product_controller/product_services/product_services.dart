import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';
import "package:http_parser/http_parser.dart";

class ProductServices {
  final dio = Dio(BaseOptions(
      baseUrl: '${kBaseUrl}admin/', responseType: ResponseType.plain));
  Future<Response<dynamic>?> getProducts() async {
    try {
      final response = await dio.get('products');
      // log(response.data.toString());
      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }

  Future<Response<dynamic>?> deleteProduct(String id) async {
    try {
      final response = await dio.get('delete-product/$id');

      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }

  Future<Response<dynamic>?> addProduct(
    String productName,
    String brand,
    String category,
    String price,
    String offerPercent,
    File imagefile1,
    File imagefile2,
    File imagefile3,
  ) async {
    String fileName1 = imagefile1.path.split('/').last;
    String fileName2 = imagefile3.path.split('/').last;
    String fileName3 = imagefile3.path.split('/').last;

    final image1 = await MultipartFile.fromFile(imagefile1.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));

    final image2 = await MultipartFile.fromFile(imagefile2.path,
        filename: fileName2, contentType: MediaType('image', 'jpg'));

    final image3 = await MultipartFile.fromFile(imagefile3.path,
        filename: fileName3, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "category": category,
      "brand": brand,
      "description": productName,
      "orginalPrice": int.parse(price),
      "offerpercentage": offerPercent,
      "image": image1,
      "image2": image2,
      "image3": image3
    });

    Map<String, String> requestHeaders = {
      "Content-Type": "multipart/form-data",
    };
    try {
      print("------------------------work avungoooooo");
      final response = await dio.post(
        'add-product',
        data: formData,
        options: Options(
          headers: requestHeaders,
        ),
      );

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> updateProduct(
      String productName,
      String brand,
      String category,
      String price,
      String percentage,
      String productId,
      File image) async {
    String fileName1 = image.path.split('/').last;
    print(productId);
    final image1 = await MultipartFile.fromFile(image.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "category": category,
      "brand": brand,
      "description": productName,
      "orginalPrice": int.parse(price),
      "offerpercentage": percentage,
      "image": image1,
    });
    log(formData.fields.toString());

    Map<String, String> requestHeaders = {
      "Content-Type": "multipart/form-data",
    };
    try {
      final response = await dio.post(
        'edit-product/$productId',
        data: formData,
        options: Options(
          headers: requestHeaders,
        ),
      );
      return response;
    } catch (e) {
      log("=======catch======${e.toString()}");
    }
    return null;
  }

  Future<Response<dynamic>?> getAllCategory() async {
    try {
      final response = await dio.get('view-category');
      return response;
    } catch (e) {
      if (e is DioError) {
        log("----------------------------------------${e.response!.data.toString()}");
      }
    }
    return null;
  }
}

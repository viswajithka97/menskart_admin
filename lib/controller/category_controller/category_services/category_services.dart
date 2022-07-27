import 'dart:developer';
import 'dart:io';
import "package:http_parser/http_parser.dart";
import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class CategoryServices {
  final dio = Dio(
    BaseOptions(baseUrl: '$kBaseUrl/admin/', responseType: ResponseType.plain),
  );

  Future<Response<dynamic>?> getAllCategory() async {
    try {
      final response = await dio.get('view-category');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> deleteCategory(String categoryId) async {
    try {
      final response = await dio.get('delete-category/$categoryId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> addCategory(
      String categoryName, File categoryImage) async {
    String fileName1 = categoryImage.path.split('/').last;

    final image = await MultipartFile.fromFile(categoryImage.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "category": categoryName,
      "image": image,
    });

    Map<String, String> requestHeaders = {
      "Content-Type": "multipart/form-data",
    };
    try {
      final response = await dio.post(
        'add-category',
        data: formData,
        options: Options(
          headers: requestHeaders,
        ),
      );

      return response;
    } catch (e) {
      log("calling catch ----------------------$e");
    }
    return null;
  }

  Future<Response<dynamic>?> updateCategory(
      String categoryName, String categoryId, File categoryImage) async {
    String fileName1 = categoryImage.path.split('/').last;

    final image = await MultipartFile.fromFile(categoryImage.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "category": categoryName,
      "image": image,
    });

    Map<String, String> requestHeaders = {
      "Content-Type": "multipart/form-data",
    };
    try {
      final response = await dio.post(
        'edit-category/$categoryId',
        data: formData,
        options: Options(
          headers: requestHeaders,
        ),
      );

      return response;
    } catch (e) {
      log("calling catch ----------------------$e");
    }
    return null;
  }
}

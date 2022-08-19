import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class OrderServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: '$kBaseUrl/admin/',
      responseType: ResponseType.plain,
    ),
  );

  Future<Response<dynamic>?> getAllUsers() async {
    try {
      final response = await dio.get('all-orders');

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

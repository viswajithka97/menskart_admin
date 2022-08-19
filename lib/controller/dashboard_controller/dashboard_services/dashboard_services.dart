import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class DashBoardServics {
  final dio = Dio(
    BaseOptions(baseUrl: '$kBaseUrl/admin', responseType: ResponseType.plain),
  );
  Future<Response<dynamic>?> getData() async {
    try {
      final response = await dio.get('');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

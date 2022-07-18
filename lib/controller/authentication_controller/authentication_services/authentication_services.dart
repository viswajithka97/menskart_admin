import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class AuthenticationServices {
  final dio = Dio(BaseOptions(
      baseUrl: '$kBaseUrl/admin/', responseType: ResponseType.plain));
  Future<Response<dynamic>?> loginCheck(Map<String, dynamic> login) async {
    try {
      final response = await dio.post('admin-login', data: jsonEncode(login));
      return response;
    } catch (e) {
      if (e is DioError) {
        log("--------------------------------------------------------${e.response!.data.toString()}");
      }
      rethrow;
    }
  }

  Future<Response<dynamic>?> logout() async {
    try {
      final response = await dio.get('admin-logout');
      log(response.data);
      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class UserServices {
  final dio = Dio(BaseOptions(
      baseUrl: '${kBaseUrl}admin/', responseType: ResponseType.plain));

  Future<Response<dynamic>?> getUsers() async {
    print('called');
    try {
      final response = await dio.get('/all-users');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> deleteUser(String id) async {
    try {
      final response = await dio.get('delete-users/$id');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  blockUser(userId) async {
    try {
      final response = await dio.get('block-user/$userId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  unBlockUser(userId) async {
    try {
      final response = await dio.get('unblock-user/$userId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

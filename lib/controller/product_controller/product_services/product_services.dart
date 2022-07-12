import 'package:dio/dio.dart';
import 'package:menskart_admin/view/core/url_constants.dart';

class ProductServices {
  final dio = Dio(BaseOptions(
      baseUrl: '$kBaseUrl/admin/', responseType: ResponseType.plain));
  Future<Response<dynamic>?> getProducts() async {
    try {
      final response = await dio.get('products');
      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }
}

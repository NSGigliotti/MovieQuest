import 'package:dio/dio.dart';
import 'package:moviequest/services/utils_services.dart';

abstract class HttpMetod {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  UtilsServices utilsServices = UtilsServices();

  Future restRequest({
    required String url,
    required String method,
    Map<String, dynamic>? headers,
    Map? body,
  }) async {
    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: headers,
        ),
        data: body,
      );
      return response.data;
    } on DioException catch (error) {
      return error.response?.data ?? {};
    } catch (message) {
      //  utilsServices.showToast(message: message, isError: true);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:moviequest/services/utils_services.dart';

abstract class HttpMetod {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    //! Header da requisição
    final defaulHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
        ),
        data: body,
      );
      return response.data;
    } on DioException catch (error) {
      return error.response?.data ?? {};
    } catch (message) {
      UtilsServices.showToast(message: message, isError: true);
    }
  }
}

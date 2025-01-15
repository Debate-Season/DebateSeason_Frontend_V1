import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['access_token'] != false) {
      String accessToken = await SecureStorageService().getAccessToken();
      if (accessToken.isNotEmpty) {
        options.headers['Authorization'] = accessToken;
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d('${response.requestOptions.method} / ${response.requestOptions.uri}\n'
        'State Code : ${response.statusCode}\n'
        'Request Data: ${response.requestOptions.data}\n'
        '${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    log.e('Error: ${options.method} / ${options.uri}\n'
        'State Code : ${err.response?.statusCode}\n'
        'Request Data: ${options.data}\n'
        'Response Data: ${err.response?.data}\n'
        'Headers: ${err.response?.headers}');

    // access token 만료 시 refresh token으로 재발급
    // final dio = DioClient().dio;
    // final isStatus401 = (err.response?.statusCode == 401);
    // final isPathRefresh = (options.path == '/users/login');
    //
    // if (isStatus401 && !isPathRefresh) {
    //   try {
    //     // todo refresh token api 호출
    //     final String accessToken = '';
    //     await SecureStorage().setAccessToken(accessToken: accessToken);
    //
    //     options.headers['authorization'] = accessToken;
    //
    //     final newResponse = await dio.fetch(options);
    //
    //     return handler.resolve(newResponse);
    //   } catch (e) {
    //     return handler.reject(err);
    //   }
    // }
    return handler.reject(err);
  }
}

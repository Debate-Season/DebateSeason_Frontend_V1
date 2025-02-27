import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'dio_client.dart';

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
        'State Code: ${err.response?.statusCode}\n'
        'Request Data: ${options.data}\n'
        'Response Data: ${err.response?.data}\n'
        'Headers: ${options.headers}');

    if (err.response?.statusCode == 401) {
      if (options.path != '/api/v1/auth/reissue') {
        await _reissueAccessToken(err, handler);
        return;
      }
    }

    return handler.reject(err);
  }

  Future<void> _reissueAccessToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final storage = SecureStorageService();
    final prefs = SharedPreferencesService();
    try {
      final refreshToken = await storage.getRefreshToken();
      final authReissueRepository = getx.Get.find<AuthReissueRepository>();

      final statusCode = await authReissueRepository.postAuthReissue(
        refreshToken: refreshToken,
      );

      if (statusCode == 200) {
        final newAccessToken = await storage.getAccessToken();
        err.requestOptions.headers['Authorization'] = newAccessToken;

        final dio = DioClient().dio;
        final newResponse = await dio.fetch(err.requestOptions);

        return handler.resolve(newResponse);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          deSnackBar('인증정보가 만료되었습니다. 다시 로그인해주세요.');

          await Future.wait([
            storage.clear(),
            prefs.clear(),
          ]);
          getx.Get.offAllNamed(GetRouterName.auth);
        }
      }
      return handler.reject(err);
    }
  }
}

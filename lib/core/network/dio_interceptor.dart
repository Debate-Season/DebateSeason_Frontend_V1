import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/users_login_repository.dart';
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

    RequestOptions? retryRequest;
    final storage = SecureStorageService();
    if (err.response?.statusCode == 401) {
      if (options.path != '/api/v1/auth/reissue') {
        retryRequest = options;
        await _reissueAccessToken(err, handler, storage);
        return;
      }

      if (options.path != '/api/v1/auth/user/login') {
        await _reissueRefreshTokens(err, handler, storage, retryRequest);
      }
    }

    return handler.reject(err);
  }

  Future<void> _reissueAccessToken(
    DioException err,
    ErrorInterceptorHandler handler,
    SecureStorageService storage,
  ) async {
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
      return handler.reject(err);
    }
  }

  Future<void> _reissueRefreshTokens(
    DioException err,
    ErrorInterceptorHandler handler,
    SecureStorageService storage,
    RequestOptions? retryRequest,
  ) async {
    try {
      final prefs = SharedPreferencesService();
      final userLoginRepository = getx.Get.find<UsersLoginRepository>();

      await userLoginRepository.postUsersLogin(
          entity: UsersLoginEntity(
        identifier: await storage.getIdentifier(),
        socialType: prefs.getSocialType(),
      ));

      final newAccessToken = await storage.getAccessToken();
      err.requestOptions.headers['Authorization'] = newAccessToken;

      final dio = DioClient().dio;
      final newResponse = await dio.fetch(retryRequest!);

      return handler.resolve(newResponse);
    } catch (e) {
      return handler.reject(err);
    }
  }
}

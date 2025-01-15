import 'dart:io';

import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
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
        'Headers: ${err.response?.headers}');

    final storage = SecureStorageService();
    if (err.response?.statusCode == 401 &&
        options.path != '/api/v1/auth/reissue') {
      await _reissueAccessToken(err, handler, storage);
    }

    if (err.response?.statusCode == 401 &&
        options.path != '/api/v1/auth/reissue') {
      await _reissueRefreshTokens(err, handler, storage);
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
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final dio = DioClient().dio;
        final newResponse = await dio.fetch(err.requestOptions);

        return handler.resolve(newResponse);
      } else {
        return handler.reject(err);
      }
    } catch (e) {
      return handler.reject(err);
    }
  }

  Future<void> _reissueRefreshTokens(
    DioException err,
    ErrorInterceptorHandler handler,
    SecureStorageService storage,
  ) async {
    try {
      final authViewModel = getx.Get.find<AuthViewModel>();

      if (Platform.isAndroid) {
        await authViewModel.kakaoLogin();
      } else if (Platform.isIOS) {
        await authViewModel.appleLogin();
      }

      final newAccessToken = await storage.getAccessToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      final dio = DioClient().dio;
      final newResponse = await dio.fetch(err.requestOptions);

      return handler.resolve(newResponse);
    } catch (e) {
      return handler.reject(err);
    }
  }
}

import 'package:debateseason_frontend_v1/common/constants/error_constants.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_entity.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_repository.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/jwt_util.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashViewModel extends GetxController {
  final storage = SecureStorageService();
  final pref = SharedPreferencesService();
  late AppVersionRepository _appVersionRepository;
  final nextRoute = ''.obs;
  final _profileStatus = false.obs;
  final appVersion = Rx<AppVersionEntity?>(null);

  bool get profileStatus => _profileStatus.value;

  @override
  void onInit() {
    super.onInit();

    AmplitudeUtil.trackEvent(eventName: 'Splash');
    _appVersionRepository = Get.find<AppVersionRepository>();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 1));

    await getAppVersions();
  }

  Future<void> getAppVersions() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final versionCode = int.parse(packageInfo.buildNumber);

    final appVersionRes = await _appVersionRepository.getAppVersion(
      versionCode: versionCode,
    );

    appVersionRes.when(
      loading: () {},
      success: (appVersionRes) {
        if (appVersionRes.versionCode > versionCode) {
          appVersion.value = appVersionRes;
        } else {
          determineNextRoute();
        }
      },
      failure: (msg) {
        deSnackBar(ErrorConstants.SERVER_ERROR);
      },
    );
  }

  Future<void> determineNextRoute() async {
    final String accessToken = await storage.getAccessToken();
    final String refreshToken = await storage.getRefreshToken();
    final bool profileStatus = pref.getProfileStatus();
    final bool termsStatus = pref.getTermsStatus();

    // 토큰 문자열 존재만으로 세션을 신뢰하지 않는다. access·refresh가 모두
    // 만료된 경우(또는 토큰 없음)에는 재로그인을 강제해 stale 토큰 요청을 막는다.
    final bool sessionAlive = accessToken.isNotEmpty &&
        !(JwtUtil.isExpired(accessToken) && JwtUtil.isExpired(refreshToken));

    if (sessionAlive) {
      if (termsStatus) {
        if (profileStatus) {
          nextRoute.value = GetRouterName.main;
        } else {
          nextRoute.value = GetRouterName.profileInput;
        }
      } else {
        _profileStatus.value = profileStatus;
        nextRoute.value = GetRouterName.terms;
      }
    } else {
      nextRoute.value = GetRouterName.auth;
    }
  }
}

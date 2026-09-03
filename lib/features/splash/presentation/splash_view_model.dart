import 'package:debateseason_frontend_v1/common/constants/error_constants.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_entity.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_repository.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/jwt_util.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
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

  // 어떤 단계가 실패해도 스플래시에 갇히지 않도록 마지막에 경로를 확정한다.
  Future<void> _startSplash() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await getAppVersions();
    } catch (e, s) {
      log.e('스플래시 초기화 실패: $e\n$s');
    } finally {
      if (nextRoute.value.isEmpty && appVersion.value == null) {
        nextRoute.value = GetRouterName.auth;
      }
    }
  }

  Future<void> getAppVersions() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final versionCode = int.parse(packageInfo.buildNumber);

    final appVersionRes = await _appVersionRepository.getAppVersion(
      versionCode: versionCode,
    );

    await appVersionRes.when(
      loading: () async => determineNextRoute(),
      success: (data) async {
        if (data.versionCode > versionCode) {
          appVersion.value = data;
          return;
        }
        await determineNextRoute();
      },
      // 버전 확인은 필수 단계가 아니다. 실패해도 로컬 상태로 진행시킨다.
      failure: (msg) async {
        deSnackBar(ErrorConstants.SERVER_ERROR);
        await determineNextRoute();
      },
    );
  }

  Future<void> determineNextRoute() async {
    final String accessToken = await storage.getAccessToken();
    final String refreshToken = await storage.getRefreshToken();

    // access·refresh가 모두 만료(또는 부재)면 재로그인을 강제한다.
    final bool sessionAlive = accessToken.isNotEmpty &&
        !(JwtUtil.isExpired(accessToken) && JwtUtil.isExpired(refreshToken));

    if (!sessionAlive) {
      nextRoute.value = GetRouterName.auth;
      return;
    }

    if (!pref.getTermsStatus()) {
      _profileStatus.value = pref.getProfileStatus();
      nextRoute.value = GetRouterName.terms;
      return;
    }

    nextRoute.value = pref.getProfileStatus()
        ? GetRouterName.main
        : GetRouterName.profileInput;
  }
}

import 'package:debateseason_frontend_v1/common/constants/error_constants.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_entity.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

import 'app_version_data_source.dart';

class AppVersionRepositoryImpl implements AppVersionRepository {
  final AppVersionDataSource dataSource;

  AppVersionRepositoryImpl(this.dataSource);

  @override
  Future<UiState<AppVersionEntity>> getAppVersion({
    required int versionCode,
  }) async {
    final response = await dataSource.getAppVersion(versionCode: versionCode);

    switch (response.status) {
      case 200:
        return UiState.success(response.data.toEntity());
      default:
        return UiState.failure(ErrorConstants.SERVER_ERROR);
    }
  }
}

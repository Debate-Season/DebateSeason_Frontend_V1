import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

import 'app_version_entity.dart';

abstract class AppVersionRepository {
  Future<UiState<AppVersionEntity>> getAppVersion({required int versionCode});
}

import 'package:debateseason_frontend_v1/features/splash/domain/app_versions_repository.dart';

import 'app_versions_data_source.dart';

class AppVersionsRepositoryImpl implements AppVersionsRepository {
  final AppVersionsDataSource dataSource;

  AppVersionsRepositoryImpl(this.dataSource);

  @override
  Future<bool?> getAppVersions({required int versionCode}) async {
    final response = await dataSource.getAppVersions(versionCode: versionCode);

    switch (response.status) {
      case 200:
        return response.data.forceUpdate;
      default:
        return null;
    }
  }
}

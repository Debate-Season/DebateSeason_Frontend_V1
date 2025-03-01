import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_nickname_check_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';

class ProfileNicknameCheckRepositoryImpl
    implements ProfileNicknameCheckRepository {
  final ProfileNicknameCheckDataSource dataSource;

  ProfileNicknameCheckRepositoryImpl(this.dataSource);

  @override
  Future<int> getProfileNicknameCheck({
    required String nickname,
  }) async {
    try {
      final response = await dataSource.getProfilesNicknameCheck(
        nickname: nickname,
      );
      return response.status;
    } catch (e, stack) {
      log.d('$e \n $stack');
      return -1;
    }
  }
}

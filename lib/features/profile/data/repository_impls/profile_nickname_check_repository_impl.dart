import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_nickname_check_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';

class ProfileNicknameCheckRepositoryImpl
    implements ProfileNicknameCheckRepository {
  final ProfileNicknameCheckDataSource dataSource;

  ProfileNicknameCheckRepositoryImpl(this.dataSource);

  @override
  Future<NullableBaseRes> getProfileNicknameCheck({
    required String nickname,
  }) async {
    return await dataSource.getProfilesNicknameCheck(nickname: nickname);
  }
}

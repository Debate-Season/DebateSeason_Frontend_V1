import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/profile_nickname_check_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class ProfileNicknameCheckRepositoryImpl
    implements ProfileNicknameCheckRepository {
  final ProfileNicknameCheckDataSource dataSource;

  ProfileNicknameCheckRepositoryImpl(this.dataSource);

  @override
  Future<UiState<String>> getProfileNicknameCheck({
    required String nickname,
  }) async {
    final response = await dataSource.getProfilesNicknameCheck(
      nickname: nickname,
    );

    switch (response.status) {
      case 200:
        return UiState.success(
          response.message,
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}

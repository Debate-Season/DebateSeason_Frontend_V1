import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/mapper/profile_mapper.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<UiState<ProfileEntity>> postProfile() async {
    final response = await dataSource.postProfiles();

    switch (response.status) {
      case 200:
        return UiState.success(
          ProfileMapper.toEntity(res: response.data),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}

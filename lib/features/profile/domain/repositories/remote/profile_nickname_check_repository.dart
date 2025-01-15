import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';

abstract class ProfileNicknameCheckRepository {
  Future<NullableBaseRes> getProfileNicknameCheck({required String nickname});
}

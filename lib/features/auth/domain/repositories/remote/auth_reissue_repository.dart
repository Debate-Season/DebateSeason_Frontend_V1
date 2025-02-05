abstract class AuthReissueRepository {
  Future<int> postAuthReissue({
    required String refreshToken,
  });
}

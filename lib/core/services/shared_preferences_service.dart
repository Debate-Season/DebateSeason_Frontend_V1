import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  late final SharedPreferences _prefs;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setSocialType({required String socialType}) async =>
      await _prefs.setString('social_type', socialType);

  String getSocialType() => _prefs.getString('social_type') ?? '';

  Future<void> setProfileStatus({required bool profileStatus}) async =>
      await _prefs.setBool('profile_status', profileStatus);

  bool getProfileStatus() => _prefs.getBool('profile_status') ?? false;

  Future<void> setNickname({required String nickname}) async =>
      await _prefs.setString('nickname', nickname);

  String getNickname() => _prefs.getString('nickname') ?? '';

  Future<void> setCommunity({required String community}) async =>
      await _prefs.setString('community', community);

  String getCommunity() => _prefs.getString('community') ?? '';

  Future<void> clear() async => await _prefs.clear();
}

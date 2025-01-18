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

  Future<void> setSocialType({required String socialType}) async {
    await _prefs.setString('social_type', socialType);
  }

  String getSocialType() {
    return _prefs.getString('social_type') ?? '';
  }

  Future<void> setProfileStatus({required bool profileStatus}) async {
    await _prefs.setBool('profile_status', profileStatus);
  }

  bool getProfileStatus() {
    return _prefs.getBool('profile_status') ?? false;
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static SharedPreferences? _sharedToken;

  static String? _timingToken;

  static String? getTimingToken() {
    return _timingToken;
  }

  static void setTimingToken(String value) {
    _timingToken = value;
  }

  static Future<void> init() async {
    _sharedToken = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({required String token}) async {
    if (_sharedToken == null) {
      throw Exception(
          "SharedPreferences is not initialized. Call Token.init() first.");
    }
    await _sharedToken!.setString('token', token);
  }

  static String? getToken() {
    if (_sharedToken == null) {
      throw Exception(
          "SharedPreferences is not initialized. Call Token.init() first.");
    }
    return _sharedToken!.getString('token');
  }

  static void removeToken() {
    if (_sharedToken == null) {
      throw Exception(
          "SharedPreferences is not initialized. Call Token.init() first.");
    }
    _sharedToken!.remove('token');
  }
}

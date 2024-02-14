import 'package:shared_preferences/shared_preferences.dart';

/// This implementation uses shared_preferences, which is NOT secure.
/// Consider using flutter_secure_storage instead. The reason I didn't
/// use it in the tutorial is because it requires a developer account
/// for Apple.
class LocalStorage {
  static const _tokenKey = 'token';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    print('reading token: $token');
    return token;
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    print('writing token: $token');
    await prefs.setString(_tokenKey, token);
  }

  Future<void> deleteToken() async {
    print('deleting token');
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}

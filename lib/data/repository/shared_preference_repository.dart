import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferenceRepository {
  void addKeyToSF(String key) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_key', key);
  }

  Future<String?> getKeyFromSF(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getString(key);
    return stringValue;
  }

  Future<bool?> getBoolFromSF(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getBool(key);
    return stringValue;
  }

  void addBoolToSF(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  void addToSF(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

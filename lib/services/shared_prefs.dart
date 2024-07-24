import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods to set and get data from SharedPreferences
  Future<void> setStringValue(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getStringValue(String key) {
    return _prefs.getString(key);
  }

  Future<void> setIntValue(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int? getIntValue(String key) {
    return _prefs.getInt(key);
  }

  Future<void> setBoolValue(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBoolValue(String key) {
    return _prefs.getBool(key);
  }

  Future<void> setDoubleValue(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  double? getDoubleValue(String key) {
    return _prefs.getDouble(key);
  }

  //Clear SharedPrefferences
  void clearData(){
    _prefs.clear();
  }

  void clearString(String key){
    _prefs.remove(key);
  }

}

import 'package:shared_preferences/shared_preferences.dart';

class SharedData{
  static late SharedPreferences prefs;
  static void setToken(String token) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
  static Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? '';
    return token;
  }
  static void setUserPhone(String phone) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_phone", phone);
  }

  static Future<String> getUserPhone() async {
    prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString("user_phone") ?? '';
    return phone;
  }
}
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  static SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper._();

  late SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // set  user token
  storeToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

// get user token
  String? getToken() {
    return sharedPreferences.getString('token');
  }
}

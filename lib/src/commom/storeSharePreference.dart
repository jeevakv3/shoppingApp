import '../../allpackages.dart';

class StoreSharePreference {
  Future<void> saveDataToSharedPreferences(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(data);
    print('store the data in SharePreference $jsonData');
    prefs.setString('userData', jsonData);
  }

  Future<Map<String, dynamic>> getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = prefs.getString('userData') ?? '{}';
    Map<String, dynamic> userData = jsonDecode(jsonData);
    return userData;
  }

  Future<void> saveEmailId(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<String> getEmailId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = await prefs.getString('email');
    return data!;
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.clear();
  }
}

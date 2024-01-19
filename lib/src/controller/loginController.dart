import '../../allpackages.dart';

class LoginController extends GetxController {
  var loginResponse = LoginResponse().obs;
  var isLoading = false.obs;

  Future<void> loginProcess(String email, String phoneno, String pwd) async {
    isLoader(true, 'Login');
    // var queryParam = {
    //   'corp_email': 'demotest@equalside.in',
    //   'phone': '1235645655',
    //   'pwd': '123'
    // };
    var queryParam = {'corp_email': email, 'phone': phoneno, 'pwd': pwd};
    var data = await ApiService().postData(queryParam, 'login.php');
    if (data != null) {
      loginResponse.value = LoginResponse.fromJson(data);
      await StoreSharePreference().saveDataToSharedPreferences(data);
      await StoreSharePreference().saveEmailId('demotest@equalside.in');
      print('model data ${loginResponse.value.name}');
      isLoader(false, 'Login');
      Get.off(Leading());
    } else {
      Get.snackbar('', 'Please check crediantial', backgroundColor: Colors.red);
      isLoader(false, 'Login');
    }
  }

  void isLoader(isLoading, type) {
    this.isLoading.value = isLoading;
    update([type]);
  }
}

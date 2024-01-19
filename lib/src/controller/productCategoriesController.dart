import '../../allpackages.dart';

class ProductCategoriesController extends GetxController {
  List<ProductCategories> productCategoriesResponse = [];

  var isLoading = false.obs;

  Future<void> fetchProductCategories() async {
    try {
      isLoader(true, 'fetchCategories');
      String email = await StoreSharePreference().getEmailId();
      print(email);
      var queryParam = {'corp_email': email, 'custid': '1'};
      List<dynamic> data =
          await ApiService().postData(queryParam, 'category.php');
      productCategoriesResponse =
          data.map((e) => ProductCategories.fromJson(e)).toList();
      isLoader(false, 'fetchCategories');
    } catch (e) {
      print('Product Categories API $e');
      isLoader(false, 'fetchCategories');
    }
    update(['fetchCategories']);
  }

  void isLoader(isLoading, type) {
    this.isLoading.value = isLoading;
    update([type]);
  }
}

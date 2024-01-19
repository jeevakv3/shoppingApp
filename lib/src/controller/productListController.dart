import '../../allpackages.dart';

class ProductListController extends GetxController {
  List<ProductListResponse> productListResponse = [];

  List<AddCartResponse> addCartResponse = [];

  MysqlService mysqlService = MysqlService();

  var isLoading = false.obs;

  var isLoadingAddCart = false.obs;

  Future<void> fetchProductList(String ccode) async {
    try {
      isLoader(true, 'fetchProductList');
      String email = await StoreSharePreference().getEmailId();
      var storeData =
          await StoreSharePreference().getDataFromSharedPreferences();
      var queryParam = {
        'corp_email': email,
        'custid': storeData['custid'] ?? '1',
        'ccode': ccode,
        'brid': storeData['brid'] ?? '1',
      };
      List<dynamic> data =
          await ApiService().postData(queryParam, 'product.php');
      productListResponse =
          data.map((e) => ProductListResponse.fromJson(e)).toList();
      isLoader(false, 'fetchProductList');
    } catch (e) {
      print('Product Categories API Exception $e');
      isLoader(false, 'fetchProductList');
    }
    update(['fetchProductList']);
  }

  Future<void> addCardProduct(var data) async {
    isLoaderAddCart(true, 'fetchAddCart');
    int id = data != null && data['id'] != null ? data['id'] : 0;
    if (data != null) {
      final db = await mysqlService.openDataBase();
      if (db != null) {
        var existingData =
            await db.query('addCartProduct', where: 'id = ?', whereArgs: [id]);
        if (existingData.isEmpty) {
          await mysqlService.insertData(data);
        } else {
          Get.snackbar('', 'Product Already in Add Card',
              backgroundColor: Colors.red);
        }
      }
    }
    final db = await mysqlService.openDataBase();
    if (db != null) {
      var dbdata = await db.query('addCartProduct');
      if (dbdata.isNotEmpty) {
        addCartResponse =
            dbdata.map((e) => AddCartResponse.fromJson(e)).toList();
        isLoaderAddCart(false, 'fetchAddCart');
      } else {
        addCartResponse = [];
        isLoaderAddCart(false, 'fetchAddCart');
      }
    }
    isLoaderAddCart(false, 'fetchAddCart');
    update(['fetchAddCart']);
  }

  Future<void> deleteCart(int id) async {
    isLoaderAddCart(true, 'fetchAddCart');
    await mysqlService.deleteData(id);
    await addCardProduct(null);
    isLoaderAddCart(false, 'fetchAddCart');
  }

  void isLoader(isLoading, type) {
    this.isLoading.value = isLoading;
    update([type]);
  }

  void isLoaderAddCart(isLoading, type) {
    this.isLoadingAddCart.value = isLoading;
    update([type]);
  }
}

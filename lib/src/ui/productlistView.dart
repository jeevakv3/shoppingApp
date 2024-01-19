import '../../allpackages.dart';

class ProductListView extends StatefulWidget {
  ProductCategories data;
  ProductListView({required this.data});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  var controller = Get.put(ProductListController());

  @override
  void initState() {
    super.initState();
    controller.fetchProductList(widget.data.ccode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<ProductListController>(
          id: 'fetchProductList',
          builder: (_) {
            return controller.isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.productListResponse.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.productListResponse.length,
                        itemBuilder: (context, index) {
                          var data = controller.productListResponse[index];
                          return SizedBox(
                            height: 200,
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name!,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.salerate!,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Price : ${data.pid!}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    Get.to(AddCardView(
                                        isAppBar: true, response: data));
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.yellowAccent),
                                    child: Center(
                                      child: Text(
                                        'Add +',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text(
                          'No records Found',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
          }),
    );
  }
}

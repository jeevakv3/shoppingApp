import '../../allpackages.dart';

class ProductCateories extends StatefulWidget {
  const ProductCateories({Key? key}) : super(key: key);

  @override
  State<ProductCateories> createState() => _ProductCateoriesState();
}

class _ProductCateoriesState extends State<ProductCateories> {
  var controller = Get.put(ProductCategoriesController());

  @override
  void initState() {
    super.initState();
    controller.fetchProductCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductCategoriesController>(
          id: 'fetchCategories',
          builder: (_) {
            return controller.isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.productCategoriesResponse.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.productCategoriesResponse
                            .length, // Number of items in the grid
                        itemBuilder: (context, index) {
                          var data =
                              controller.productCategoriesResponse[index];
                          return InkWell(
                            onTap: () {
                              Get.to(ProductListView(
                                data: data,
                              ));
                            },
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.deepPurple,
                                        child: Text(
                                          data.id,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ListTile(
                                      title: Text('Name :  ${data.name}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
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

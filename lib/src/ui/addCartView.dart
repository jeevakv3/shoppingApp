import '../../allpackages.dart';

class AddCardView extends StatefulWidget {
  bool isAppBar;
  ProductListResponse? response;
  AddCardView({required this.isAppBar, this.response});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  var controller = Get.put(ProductListController());

  @override
  void initState() {
    super.initState();
    var data;
    if (widget.response != null) {
      data = {
        'id': int.parse(widget.response!.pid!),
        'pid': widget.response!.pid,
        'name': widget.response!.name,
        'salerate': widget.response!.salerate
      };
    }
    controller.addCardProduct(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppBar
          ? AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text(
                'Add Cart',
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
            )
          : null,
      body: GetBuilder<ProductListController>(
          id: 'fetchAddCart',
          builder: (_) {
            return controller.isLoadingAddCart.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.addCartResponse.isNotEmpty &&
                        controller.addCartResponse.length > 0
                    ? ListView.builder(
                        itemCount: controller.addCartResponse.length,
                        itemBuilder: (context, index) {
                          var data = controller.addCartResponse[index];
                          return SizedBox(
                            height: 250,
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
                                      data.name! ?? '-',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Salerate ${data.salerate}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Price ${data.pid}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Remove',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                // Return the AlertDialog
                                                return AlertDialog(
                                                  content: Text(
                                                      'Are you sure Do you want to remove this Item?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        controller.deleteCart(
                                                            data.id!);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text(
                          'No records found',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
          }),
    );
  }
}

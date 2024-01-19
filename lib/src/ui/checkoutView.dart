import '../../allpackages.dart';

class Checkout extends StatefulWidget {
  List<AddCartResponse> data;
  Checkout({required this.data});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<String> productName = [];

  num price = 0;

  bool isOrderPlaced = false;

  @override
  void initState() {
    super.initState();
    widget.data.forEach((element) {
      productName.add(element.name!);
      price += int.parse(element.pid!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Order Place',
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
      body: isOrderPlaced
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productName.length,
                    itemBuilder: (context, index) {
                      var data = widget.data[index];
                      return ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName[index] ?? '-',
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
                          ],
                        ),
                      );
                    }),
              ),
              Text(
                'Total Product : ${productName.length}',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Total Price : $price',
                style: TextStyle(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      isOrderPlaced = true;
                      Future.delayed(Duration(seconds: 5), () {
                        Get.snackbar('', 'Order has been successfully Placed',
                            backgroundColor: Colors.green);
                        Get.offAll(Leading());
                      });
                    });
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow),
                      child: const Center(
                        child: Text(
                          'Finish',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
    );
  }
}

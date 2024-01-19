import '../../allpackages.dart';

class Leading extends StatefulWidget {
  const Leading({Key? key}) : super(key: key);

  @override
  State<Leading> createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  Widget currentPage = ProductCateories();

  bool isAddCart = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: isAddCart
            ? Text(
                'Add Cart',
                style: TextStyle(color: Colors.white),
              )
            : Text(
                'Product Categories',
                style: TextStyle(color: Colors.white),
              ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: currentPage,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'demotest@equalside.in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1235645655',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.deepPurple,
                  ),
                  Text('Product Categories'),
                ],
              ),
              onTap: () {
                setState(() {
                  isAddCart = false;
                  currentPage = ProductCateories();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.deepPurple,
                  ),
                  Text('Add Card'),
                ],
              ),
              onTap: () {
                setState(() {
                  isAddCart = true;
                  currentPage = AddCardView(
                    isAppBar: false,
                    response: null,
                  );
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.deepPurple,
                  ),
                  Text('Logout'),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Return the AlertDialog
                    return AlertDialog(
                      content:
                          Text('Are you sure Do want to Logout this account?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await StoreSharePreference().clearUserData();
                            Get.offAll(Login());
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            // Add more ListTiles for additional items
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import '../../../allpackages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () async {
      if (await checkUser()) {
        Get.offAll(Leading());
      } else {
        Get.offAll(Login());
      }
    });
  }

  Future<bool> checkUser() async {
    Map<String, dynamic> userData =
        await StoreSharePreference().getDataFromSharedPreferences();
    return userData.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/splashScreen.json',
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Shopping App',
            style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

import '../../allpackages.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GetBuilder<LoginController>(
          id: 'Login',
          builder: (_) {
            return controller.isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                  )),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                ),
                                controller: emailController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                  )),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Phone no",
                                ),
                                controller: phonenoController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                  )),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                ),
                                controller: passwordController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                          InkWell(
                            onTap: () {
                              if (emailController.text.isNotEmpty &&
                                  phonenoController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                controller.loginProcess(
                                    emailController.text,
                                    phonenoController.text,
                                    passwordController.text);
                              } else {
                                Get.snackbar('', 'Please Enter all Field',
                                    backgroundColor: Colors.red);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}

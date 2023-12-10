import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './input_widget.dart';
import './login.dart';
import '../controller/authentication.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Register', style: TextStyle(fontSize: size * 0.08)),
            const SizedBox(height: 30),
            InputWidget(
              hintText: 'Name',
              controller: nameController,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'UserName',
              controller: userController,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await authenticationController.register(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text.trim(),
                    username: userController.text.trim(),
                  );
                },
                child: Obx(() {
                  return authenticationController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : const Text('Register');
                })),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Get.to(() => Login());
                },
                child: Text('Login',
                    style:
                        TextStyle(color: Colors.black, fontSize: size * 0.05)))
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './input_widget.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Login'),
        SizedBox(height: 30),
        InputWidget(
          hintText: 'Email',
          controller: emailController,
          obscureText: false,
        ),
        SizedBox(height: 30),
        InputWidget(
          hintText: 'Password',
          controller: passwordController,
          obscureText: true,
        ),
      ]),
    );
  }
}

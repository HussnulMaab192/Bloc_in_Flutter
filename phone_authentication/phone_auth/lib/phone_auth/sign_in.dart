import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/phone_auth/verification_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In With Phone"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone Number without Country Code and zero",
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CupertinoButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const Verification()));
            },
            child: const Text("Sign In"),
          )
        ],
      ),
    );
  }
}

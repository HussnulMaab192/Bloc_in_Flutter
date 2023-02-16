import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Home/home.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone"),
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
                  hintText: "6 digit OTP",
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
                    builder: (context) => const Home(),
                  ));
            },
            child: const Text("Verify"),
          )
        ],
      ),
    );
  }
}

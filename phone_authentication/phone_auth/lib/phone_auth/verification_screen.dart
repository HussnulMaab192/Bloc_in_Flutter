import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/Home/home.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_state.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

TextEditingController otpController = TextEditingController();

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              controller: otpController,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "6 digit OTP",
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedInState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const Home(),
                    ));
              } else if (state is AuthErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            builder: (context, state) {
              return state is AuthLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(otpController.text);
                      },
                      child: const Text("Verify"),
                    );
            },
          )
        ],
      ),
    );
  }
}

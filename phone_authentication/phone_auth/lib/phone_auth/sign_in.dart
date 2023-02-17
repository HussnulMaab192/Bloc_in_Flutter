import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_state.dart';
import 'package:phone_auth/phone_auth/verification_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController phoneController = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In With Phone"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              controller: phoneController,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone Number without Country Code and zero",
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthCodeSentState) {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const Verification();
                  },
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
                        String myPhno = "+92${phoneController.text}";
                        BlocProvider.of<AuthCubit>(context).sendOTP(myPhno);
                      },
                      child: const Text("Sign In"),
                    );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_state.dart';
import 'package:phone_auth/phone_auth/sign_in.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedOutState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => SignIn()));
                }
              },
              builder: (context, state) {
                return CupertinoButton(
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logOut();
                  },
                  child: const Text("Log Out"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

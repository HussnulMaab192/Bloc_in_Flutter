import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/Home/home.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_state.dart';

import 'phone_auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) {
            return previous is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return const Home();
            } else if (state is AuthLoggedOutState) {
              return const SignIn();
            } else {
              return const Scaffold();
            }
          },
        ),
      ),
    );
  }
}

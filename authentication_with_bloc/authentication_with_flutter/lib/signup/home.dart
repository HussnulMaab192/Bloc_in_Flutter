import 'package:authentication_with_flutter/signup/bloc/events.dart';
import 'package:authentication_with_flutter/signup/bloc/sign_up_bloc.dart';
import 'package:authentication_with_flutter/signup/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController email = TextEditingController();
TextEditingController pswd = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign With Email"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SignUpBloc, SignUpStates>(
            builder: (context, state) {
              return state is ErrorState
                  ? Text(state.message!,
                      style: const TextStyle(color: Colors.red))
                  : Container();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: email,
            onChanged: (value) {
              BlocProvider.of<SignUpBloc>(context)
                  .add(TextFieldChangeEvent(email.text, pswd.text));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: pswd,
            onChanged: (value) {
              BlocProvider.of<SignUpBloc>(context)
                  .add(TextFieldChangeEvent(email.text, pswd.text));
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SignUpBloc, SignUpStates>(
            builder: (context, state) {
              return state is LoadingState
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    )
                  : CupertinoButton(
                      onPressed: () {
                        BlocProvider.of<SignUpBloc>(context)
                            .add(SignUpPressEvent(email.text, pswd.text));
                      },
                      color: state is ValidState ? Colors.blue : Colors.grey,
                      child: const Text(
                        "Sign Up",
                      ));
            },
          ),
        ],
      ),
    );
  }
}

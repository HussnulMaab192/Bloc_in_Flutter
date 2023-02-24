import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/cubits/app_states.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/discover_nav_pages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          print("state is $state");
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is Loadingtate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Loadedstate) {
            return const MainPage();
          }
          if (state is DetailsState) {
            return const DetailsPage();
          }
          if (state is ErrorState) {
            return Scaffold(
              body: Center(child: Text(state.errorMessage)),
            );
          } else {
            return const Scaffold(
              body: Center(child: Text("Hello Ki hal ay")),
            );
          }
        },
      ),
    );
  }
}

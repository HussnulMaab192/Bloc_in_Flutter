import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/services/app_services.dart';

import 'cubits/app_cubit_logics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: BlocProvider(
                create: (context) => AppCubit(data: DataServices()),
                child: const AppCubitLogics(),
              )
              // home:const MainPage(),
              // home: const DetailsPage(),
              );
        });
  }
}

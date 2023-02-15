// import 'package:counter_with_bloc/bloc/counter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/counter_event.dart';
// import 'bloc/counter_state.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<CounterBloc, CounterState>(
//         builder: (context, state) {
//           int count = 0;
//           if (state is IncrementState) {
//             count = ++counter;
//           } else if (state is DecrementState && counter > 0) {
//             count = --counter;
//           } else if (state is ClearState) {
//             count = 0;
//           }
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Count Value : $count",
//                 style:
//                     const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<CounterBloc>(context)
//                             .add(IncrementEvent());
//                       },
//                       child: const Text("Increment")),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<CounterBloc>(context)
//                             .add(DecrementEvent());
//                       },
//                       child: const Text("Decrement")),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<CounterBloc>(context).add(ClearEvent());
//                       },
//                       child: const Text("Clear")),
//                 ],
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

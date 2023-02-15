import 'package:counter_with_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounter extends StatefulWidget {
  const CubitCounter({super.key});

  @override
  State<CubitCounter> createState() => _CubitCounterState();
}

class _CubitCounterState extends State<CubitCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          // int count = 0;
          // if (state == CounterStates.increment) {
          //   count = ++counter;
          // } else if (state == CounterStates.decrement && counter > 0) {
          //   count = --counter;
          // } else if (state == CounterStates.clear) {
          //   count = 0;
          // }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Count Value : $counter",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().incrementCounter();
                      },
                      child: const Text("Increment")),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrementCounter();
                      },
                      child: const Text("Decrement")),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().clearCounter();
                      },
                      child: const Text("Clear")),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

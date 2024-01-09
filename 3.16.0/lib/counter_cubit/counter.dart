import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/counter_cubit/counter_cubit.dart';

class Counter extends StatelessWidget {
  Counter({super.key});

  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cubit Counter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterCubit.add(),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count:', style: Theme.of(context).textTheme.headlineSmall,),
                Text(state.toString(), style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}

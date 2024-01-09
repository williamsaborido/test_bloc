import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/counter_state_cubit.dart/counter_state_cubit.dart';

class CounterState extends StatelessWidget {
  CounterState({super.key});

  final counterStateCubit = CounterStateCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cubit Counter with State'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterStateCubit.add(),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CounterStateCubit, CountState>(
        bloc: counterStateCubit,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                Builder(builder: (context) {
                  if (state.status == CountStatus.loading) {
                    return CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,                      
                    );
                  } else {
                    return Text(
                      state.value.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

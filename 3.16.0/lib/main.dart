import 'package:flutter/material.dart';
import 'package:test/counter_cubit/counter.dart';
import 'package:test/counter_state_cubit.dart/counter_state.dart';
import 'package:test/crud_packageless/views/crud_packageless.dart';
import 'package:test/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'counter-cubit': (context) => Counter(),
        'counter-state-cubit': (context) => CounterState(),
        'crud-packageless': (context) => const CrudPackageless(),
      },
    );
  }
}

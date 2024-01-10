import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Test - exemplos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('counter-cubit');
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Contador (counter)'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('counter-state-cubit');
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Contador com State Class (counter)'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('crud-packageless');
              },
              icon: const Icon(Icons.person),
              label: const Text('Crud com BloC (packageless)'),
            ),
          ],
        ),
      ),
    );
  }
}

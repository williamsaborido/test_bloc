import 'package:flutter/material.dart';
import 'package:test/crud_packageless/bloc/client_bloc.dart';
import 'package:test/crud_packageless/bloc/client_events.dart';
import 'package:test/crud_packageless/bloc/client_states.dart';
import 'package:test/crud_packageless/models/client.dart';
import 'package:test/crud_packageless/views/add_client.dart';

class CrudPackageless extends StatefulWidget {
  const CrudPackageless({super.key});

  @override
  State<CrudPackageless> createState() => _CrudPackagelessState();
}

class _CrudPackagelessState extends State<CrudPackageless> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.input.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.input.close();
    super.dispose();
  }

  void _addClient(BuildContext context) async {
    var name = await showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: AddClient(),
      ),
    );

    if (name != '' && name != null) {
      bloc.input.add(
        AddClientEvent(
          client: Client(name: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud BloC (packageless)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addClient(context),
        child: const Icon(Icons.person_add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<ClientState>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              final list = snapshot.data?.clients ?? [];

              if (snapshot.data is ClientLoadingState){
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data is ClientSuccessState && list.isEmpty){
                return const Center(child: Icon(Icons.search));
              }

              return ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(50),
                        child: Text(list[index].name[0]),
                      ),
                    ),
                    title: Text(list[index].name),
                    trailing: IconButton(
                      onPressed: () => bloc.input
                          .add(RemoveClientEvent(client: list[index])),
                      icon: const Icon(Icons.person_remove_rounded),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }),
      ),
    );
  }
}

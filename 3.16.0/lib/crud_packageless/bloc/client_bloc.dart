import 'dart:async';

import 'package:test/crud_packageless/bloc/client_events.dart';
import 'package:test/crud_packageless/bloc/client_states.dart';
import 'package:test/crud_packageless/models/client.dart';
import 'package:test/crud_packageless/repositories/client_repository.dart';

class ClientBloc {
  final _repository = ClientRepository();

  final _inputController = StreamController<ClientEvent>();
  final _outputController = StreamController<ClientState>();

  Sink<ClientEvent> get input => _inputController.sink;
  Stream<ClientState> get stream => _outputController.stream;

  ClientBloc() {
    _inputController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ClientEvent event) async {
    List<Client> clients = [];

    switch (event) {
      case LoadClientEvent():
        clients = await _repository.loadClients();
      case AddClientEvent():
        clients = await _repository.addClient(event.client);
      case RemoveClientEvent():
        clients = await _repository.removeClient(event.client);
    }

    _outputController.add(ClientSuccessState(clients: clients));
  }
}

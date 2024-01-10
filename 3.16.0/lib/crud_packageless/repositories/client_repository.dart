import 'package:test/crud_packageless/models/client.dart';

class ClientRepository {
  final List<Client> _clients = [
    Client(name: 'William'),
    Client(name: 'Renato'),
    Client(name: 'Joyce'),
    Client(name: 'Armando'),
    Client(name: 'Jussara'),
    Client(name: 'John'),
    Client(name: 'Mark'),
    Client(name: 'Patrícia'),
    Client(name: 'Osvaldo'),
    Client(name: 'Graça'),
  ];

  Future<List<Client>> loadClients() async {
    await Future.delayed(const Duration(seconds: 1));
    return _clients;
  }

  Future<List<Client>> addClient(Client client) async {
    await Future.delayed(const Duration(seconds: 1));
    _clients.add(client);
    return _clients;
  }

  Future<List<Client>> removeClient(Client client) async {
    await Future.delayed(const Duration(seconds: 1));
    _clients.remove(client);
    return _clients;
  }
}

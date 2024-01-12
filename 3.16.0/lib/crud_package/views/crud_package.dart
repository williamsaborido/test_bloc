import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/crud_package/bloc/customer_bloc.dart';
import 'package:test/crud_package/bloc/customer_event.dart';
import 'package:test/crud_package/bloc/customer_state.dart';
import 'package:test/crud_package/models/customer.dart';
import 'package:test/crud_package/views/create_customer.dart';

class CrudPackage extends StatefulWidget {
  const CrudPackage({super.key});

  @override
  State<CrudPackage> createState() => _CrudPackageState();
}

class _CrudPackageState extends State<CrudPackage> {
  late final CustomerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CustomerBloc();
    _bloc.add(GetListCustomerEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _addCustomer(BuildContext context) async {
    (String name, String card)? customer = await showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: CreateCustomer(),
      ),
    );

    if (customer != null) {
      _bloc.add(
        CreateCustomerEvent(
          customer: Customer(name: customer.$1, card: customer.$2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud BloC (package)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCustomer(context),
        child: const Icon(Icons.person_add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<CustomerBloc, CustomerState>(
            bloc: _bloc,
            builder: (context, snapshot) {
              final list = snapshot.data;

              if (snapshot is CustomerLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot is CustomerSuccessState && list.isEmpty) {
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
                    subtitle: Text('Cartão: ${list[index].card}'),
                    trailing: IconButton(
                      onPressed: () =>
                          _bloc.add(DeleteCustomerEvent(customer: list[index])),
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

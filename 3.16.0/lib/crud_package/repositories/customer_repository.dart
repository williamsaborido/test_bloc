import 'package:test/crud_package/models/customer.dart';

class CustomerRepository {
  final List<Customer> _data = [
    Customer(name: 'William', card: '132.123.123'),
    Customer(name: 'Renato', card: '432.163.023'),
    Customer(name: 'Aline', card: '002.313.768'),
    Customer(name: 'Paulo', card: '792.894.000'),
    Customer(name: 'Ângelo', card: '657.723.444'),
    Customer(name: 'Pâmela', card: '122.333.567'),
    Customer(name: 'Mirella', card: '543.875.123'),
    Customer(name: 'Antônio', card: '765.234.986'),
  ];

  Future<List<Customer>> getList() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return _data;
  }

  Future<List<Customer>> create(Customer customer) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _data.add(customer);
    return _data;
  }

  Future<List<Customer>> delete(Customer customer) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _data.remove(customer);
    return _data;
  }
}

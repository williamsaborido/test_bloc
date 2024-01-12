import 'package:test/crud_package/models/customer.dart';

sealed class CustomerEvent {}

class GetListCustomerEvent extends CustomerEvent {}

class CreateCustomerEvent extends CustomerEvent {
  final Customer customer;

  CreateCustomerEvent({required this.customer});
}

class DeleteCustomerEvent extends CustomerEvent {
  final Customer customer;

  DeleteCustomerEvent({required this.customer});
}

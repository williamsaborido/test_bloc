import 'package:test/crud_package/models/customer.dart';

sealed class CustomerState {
  List<Customer> data;

  CustomerState({required this.data});
}

final class CustomerInitialState extends CustomerState {
  CustomerInitialState() : super(data: []);
}

final class CustomerLoadingState extends CustomerState {
  CustomerLoadingState() : super(data: []);
}

final class CustomerSuccessState extends CustomerState {
  CustomerSuccessState({required List<Customer> data}) : super(data: data);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/crud_package/bloc/customer_event.dart';
import 'package:test/crud_package/bloc/customer_state.dart';
import 'package:test/crud_package/repositories/customer_repository.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final _repository = CustomerRepository();

  CustomerBloc() : super(CustomerInitialState()) {
    on<GetListCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      final data = await _repository.getList();
      emit(CustomerSuccessState(data: data));
    });

    on<CreateCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      var data = await _repository.create(event.customer);
      emit(CustomerSuccessState(data: data));
    });

    on<DeleteCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      var data = await _repository.delete(event.customer);
      emit(CustomerSuccessState(data: data));
    });
  }
}

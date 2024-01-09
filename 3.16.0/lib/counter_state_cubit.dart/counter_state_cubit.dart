import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CountStatus {
  loading,
  ready,
}

class CountState {
  final CountStatus status;
  final int value;

  CountState({required this.status, required this.value});

  CountState copyWith({
    CountStatus? status,
    int? value,
  }) {
    return CountState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }
}

class CounterStateCubit extends Cubit<CountState> {
  CounterStateCubit() : super(CountState(status: CountStatus.ready, value: 0));

  void add() async {

    var newValue = state.value + 1;

    emit(state.copyWith(status: CountStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(status: CountStatus.ready, value: newValue));
  }

  @override
  void onChange(Change<CountState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}

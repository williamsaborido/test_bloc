import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CounterCubit extends Cubit<int>{
  
  CounterCubit() : super(0);

  void add(){

    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
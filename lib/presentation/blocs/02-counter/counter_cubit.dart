import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {

  // El estado inicial es 5
  CounterCubit():super(5);

  void incrementBy(int value) => emit(state + value);
}

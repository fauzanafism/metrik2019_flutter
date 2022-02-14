import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countersoal_event.dart';
part 'countersoal_state.dart';

class CountersoalBloc extends Bloc<CountersoalEvent, CountersoalState> {
  CountersoalBloc() : super(CountersoalInitial()) {
    on<NextsoalEvent>((event, emit) {
      emit(SoalInitialized(state.noSoal + 1));
    });
    on<ResetEvent>((event, emit) {
      emit(CountersoalInitial());
    });
  }
}

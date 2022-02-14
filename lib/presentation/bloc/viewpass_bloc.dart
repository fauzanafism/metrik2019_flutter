import 'package:bloc/bloc.dart';

part 'viewpass_event.dart';
part 'viewpass_state.dart';

class ViewpassBloc extends Bloc<ViewpassEvent, ViewpassState> {
  ViewpassBloc() : super(ViewpassInitial()) {
    on<TapEvent>((event, emit) {
      emit(ViewpassTapped(!state.isSecure));
    });
  }
}

part of 'countersoal_bloc.dart';

abstract class CountersoalEvent extends Equatable {
  final int noSoal;
  const CountersoalEvent(this.noSoal);

  @override
  List<Object> get props => [noSoal];
}

class NextsoalEvent extends CountersoalEvent {
  NextsoalEvent(int noSoal) : super(noSoal);
}

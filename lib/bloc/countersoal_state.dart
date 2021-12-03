part of 'countersoal_bloc.dart';

abstract class CountersoalState extends Equatable {
  final int noSoal;
  const CountersoalState(this.noSoal);
  
  @override
  List<Object> get props => [noSoal];
}

class CountersoalInitial extends CountersoalState {
  CountersoalInitial() : super(1);
}

class SoalInitialized extends CountersoalState {
  SoalInitialized(int noSoal) : super(noSoal);
}
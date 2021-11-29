part of 'viewpass_bloc.dart';

abstract class ViewpassState {
  final bool isOpen;
  
  const ViewpassState(this.isOpen);
  
}

class ViewpassInitial extends ViewpassState {
  const ViewpassInitial() : super(false);
}

class ViewpassTapped extends ViewpassState {
  const ViewpassTapped(bool isOpen) : super(isOpen);
}
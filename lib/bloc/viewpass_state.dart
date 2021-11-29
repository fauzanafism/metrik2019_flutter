part of 'viewpass_bloc.dart';

abstract class ViewpassState {
  final bool isSecure;
  
  const ViewpassState(this.isSecure);
  
}

class ViewpassInitial extends ViewpassState {
  const ViewpassInitial() : super(true);
}

class ViewpassTapped extends ViewpassState {
  const ViewpassTapped(bool isOpen) : super(isOpen);
}
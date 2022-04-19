part of 'press_bloc.dart';

abstract class PressEvent extends Equatable {
  const PressEvent();

  @override
  List<Object> get props => [];
}

class NameSaved extends PressEvent {
  const NameSaved({required this.name});

  final String name;
}

class ScreenPressed extends PressEvent {}

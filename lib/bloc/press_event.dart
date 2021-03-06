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

class ResetGame extends PressEvent {}

class RankUpdated extends PressEvent {}

class ButtonStatusChanged extends PressEvent {
  const ButtonStatusChanged({
    required this.pressed,
  });

  final bool pressed;
}

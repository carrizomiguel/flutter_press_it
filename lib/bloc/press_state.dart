part of 'press_bloc.dart';

enum PressStep {
  naming,
  game,
  admin,
}

enum GameStatus {
  notPressed,
  pressed,
  win,
}

class PressState extends Equatable {
  const PressState({
    this.step = PressStep.naming,
    this.gameStatus = GameStatus.notPressed,
    this.groupName = "",
    this.pressed = false,
  });

  final PressStep step;
  final GameStatus gameStatus;
  final String groupName;
  final bool pressed;

  PressState copyWith({
    PressStep? step,
    GameStatus? gameStatus,
    String? groupName,
    bool? pressed,
  }) {
    return PressState(
      step: step ?? this.step,
      gameStatus: gameStatus ?? this.gameStatus,
      groupName: groupName ?? this.groupName,
      pressed: pressed ?? this.pressed,
    );
  }

  @override
  List<Object> get props => [
        step,
        gameStatus,
        groupName,
        pressed,
      ];
}

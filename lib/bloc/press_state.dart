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
  });

  final PressStep step;
  final GameStatus gameStatus;
  final String groupName;

  PressState copyWith({
    PressStep? step,
    GameStatus? gameStatus,
    String? groupName,
  }) {
    return PressState(
      step: step ?? this.step,
      gameStatus: gameStatus ?? this.gameStatus,
      groupName: groupName ?? this.groupName,
    );
  }

  @override
  List<Object> get props => [
        step,
        gameStatus,
        groupName,
      ];
}

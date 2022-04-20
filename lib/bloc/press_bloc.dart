import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:press_it/services/firebase_service.dart';

part 'press_event.dart';
part 'press_state.dart';

class PressBloc extends Bloc<PressEvent, PressState> {
  PressBloc() : super(const PressState()) {
    on<NameSaved>(_onNameSaved);
    on<ScreenPressed>(_onScreenPressed);
    on<ResetGame>(_onResetGame);
    on<RankUpdated>(_onRankUpdated);
    on<ButtonStatusChanged>(_onButtonStatusChanged);
  }

  void _onNameSaved(
    NameSaved event,
    Emitter emit,
  ) {
    if (event.name.isNotEmpty) {
      if (event.name == 'adminmanolito456') {
        emit(state.copyWith(
          step: PressStep.admin,
          groupName: event.name,
        ));
      } else {
        emit(state.copyWith(
          step: PressStep.game,
          groupName: event.name,
        ));
      }
    }
  }

  void _onScreenPressed(
    ScreenPressed event,
    Emitter emit,
  ) async {
    await FirebaseService.addGroupToRank(
      state.groupName,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  void _onResetGame(
    ResetGame event,
    Emitter emit,
  ) async {
    await FirebaseService.resetAllDocuments();
  }

  void _onRankUpdated(
    RankUpdated event,
    Emitter emit,
  ) async {
    final today = DateTime.now();
    final yearsAdded = today.add(const Duration(days: 365));
    await FirebaseService.addGroupToRank(
      'update',
      yearsAdded.millisecondsSinceEpoch,
    );
  }

  void _onButtonStatusChanged(
    ButtonStatusChanged event,
    Emitter emit,
  ) {
    emit(state.copyWith(
      pressed: event.pressed,
    ));
  }
}

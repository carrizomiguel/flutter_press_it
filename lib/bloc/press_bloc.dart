import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:press_it/models/group.dart';
import 'package:press_it/services/firebase_service.dart';

part 'press_event.dart';
part 'press_state.dart';

class PressBloc extends Bloc<PressEvent, PressState> {
  PressBloc() : super(const PressState()) {
    on<NameSaved>(_onNameSaved);
    on<ScreenPressed>(_onScreenPressed);
  }

  late StreamSubscription<Group> group;

  void _onNameSaved(
    NameSaved event,
    Emitter emit,
  ) {
    if (event.name.isNotEmpty) {
      emit(state.copyWith(
        step: PressStep.game,
        groupName: event.name,
      ));
    }
  }

  void _onScreenPressed(
    ScreenPressed event,
    Emitter emit,
  ) async {
    await FirebaseService.pressGroupName(
      state.groupName,
    );
  }
}

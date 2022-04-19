import 'package:flutter/widgets.dart';
import 'package:press_it/bloc/press_bloc.dart';
import 'package:press_it/views/group_form.dart';
import 'package:press_it/views/press_screen.dart';

List<Page> onGenerateAppPages(PressState state, List<Page> pages) {
  switch (state.step) {
    case PressStep.naming:
      return [GroupForm.page()];
    case PressStep.game:
      return [PressScreen.page()];
  }
}
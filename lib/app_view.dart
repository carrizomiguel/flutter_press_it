import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_it/bloc/press_bloc.dart';
import 'package:press_it/routes/routes.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: context.select((PressBloc bloc) => bloc.state),
      onGeneratePages: onGenerateAppPages,
    );
  }
}

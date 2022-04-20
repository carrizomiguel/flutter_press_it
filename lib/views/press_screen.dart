import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_it/bloc/press_bloc.dart';
import 'package:press_it/models/group.dart';
import 'package:press_it/services/firebase_service.dart';

class PressScreen extends StatelessWidget {
  const PressScreen({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: PressScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Group>(
      stream: FirebaseService.getWinnerGroup(),
      builder: (context, snapshot) {
        final pressBloc = context.read<PressBloc>();
        final groupName = pressBloc.state.groupName;

        return ElevatedButton(
          onPressed: () {
            pressBloc.add(ScreenPressed());
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Presiona',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: groupName == snapshot.data?.groupWinner
                ? Colors.green
                : Colors.red.shade800,
          ),
        );
      },
    );
  }
}

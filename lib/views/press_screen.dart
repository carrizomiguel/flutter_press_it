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
    return Material(
      color: Colors.white,
      child: StreamBuilder<Group>(
        stream: FirebaseService.getWinnerGroup(),
        builder: (context, snapshot) {
          final pressBloc = context.watch<PressBloc>();
          final groupName = pressBloc.state.groupName;

          if (snapshot.data?.groupWinner == "") {
            pressBloc.add(const ButtonStatusChanged(
              pressed: false,
            ));
          } else if (snapshot.data?.groupWinner == groupName) {
            pressBloc.add(const ButtonStatusChanged(
              pressed: false,
            ));
          } else if (snapshot.data?.groupWinner != groupName) {
            pressBloc.add(const ButtonStatusChanged(
              pressed: true,
            ));
          }

          return ElevatedButton(
            onPressed: pressBloc.state.pressed
                ? null
                : () {
                    pressBloc.add(ScreenPressed());
                    pressBloc.add(const ButtonStatusChanged(
                      pressed: true,
                    ));
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
      ),
    );
  }
}

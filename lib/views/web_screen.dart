import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:press_it/models/group.dart';
import 'package:press_it/services/firebase_service.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Group>(
      stream: FirebaseService.getWinnerGroup(),
      builder: (context, snapshot) {
        final group = snapshot.data?.groupWinner;

        return Material(
          child: Container(
            color: Colors.green,
            child: Center(
              child: group == "" || group == null
                  ? const SpinKitCubeGrid(
                    color: Colors.white,
                    size: 100,
                  )
                  : Text(
                      group,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

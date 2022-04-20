import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_it/bloc/press_bloc.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: AdminScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final pressBloc = context.read<PressBloc>();
                pressBloc.add(ResetGame());
              },
              child: const Text('Reset'),
            ),
            // const SizedBox(height: 15),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Prepare'),
            // ),
          ],
        ),
      ),
    );
  }
}

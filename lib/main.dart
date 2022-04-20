import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_it/app_view.dart';
import 'package:press_it/bloc/press_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Press It',
    options: const FirebaseOptions(
      apiKey: "AIzaSyAFWwlibJUZ2RoPXRZPcnCWUe261SGP98Y",
      projectId: "press-it-6d3fd",
      messagingSenderId: "752324812853",
      appId: "1:752324812853:web:beb928afcf7a774ea1d17c"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PressBloc(),
        child: const AppView(),
      ),
    );
  }
}

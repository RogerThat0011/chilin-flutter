import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:t_store/app.dart';
import 'package:t_store/firebase_options.dart';

Future<void> main() async {

  //INICIALIZAR FIREBASE
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}
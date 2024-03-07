import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {

  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //LOCAL STORAGE
  await GetStorage.init();

  //SPLASH
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //INICIALIZAR FIREBASE
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
          (value) => Get.put(AuthenticationRepository())
      );

  runApp(const App());
}
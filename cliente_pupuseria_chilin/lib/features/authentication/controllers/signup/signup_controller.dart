import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/features/screens/signup/widgets/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/network/NetworkManager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //VARIABLES
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future <void> signup() async {
    try {
      //LOADING
      //FullScreenLoader.openLoadingDialog('Estamos procesando tu informacion...', TImages.productsIllustration);

      //VERIFY INTERNET CONNECTION
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //FORM VALIDATION
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //PRIVACY POLICY
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Acepta los terminos',
            message:
            'Acepta los terminos y condiciones para poder crear tu cuenta');
        FullScreenLoader.stopLoading();
        return;
      }

      //REGISTER USER IN FIREBASE
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //SAVE THE USER IN FIREBASE
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: '¡Satisfactorio!', message: 'Tu cuenta ha sido creada con exito, verifica tu email para continuar.');

      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();

      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }
}

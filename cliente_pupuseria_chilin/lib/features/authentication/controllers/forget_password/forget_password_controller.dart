
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/network/NetworkManager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController{

  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async{
    try{
      FullScreenLoader.openLoadingDialog('Procesando tu peticion...', TImages.docerAnimation);

      //VERIFY INTERNET CONNECTION
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if(!forgetPasswordFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();
      
      Loaders.successSnackBar(title: 'Emil enviado', message: '¡El link para restablecer tu contraseña ha sido enviado a tu correo electronico!');

      Get.to(() => ResetPassword(email: email.text.trim()));
    }catch(e){
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{
      FullScreenLoader.openLoadingDialog('Procesando tu peticion...', TImages.docerAnimation);

      //VERIFY INTERNET CONNECTION
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Emil enviado', message: '¡El link para restablecer tu contraseña ha sido enviado nuevamente a tu correo electronico!');

    }catch(e){
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }
}
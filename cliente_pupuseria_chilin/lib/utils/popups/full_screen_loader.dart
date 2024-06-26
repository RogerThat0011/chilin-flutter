import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/popups/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? TColors.dark
                    : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    AnimationLoaderWidget(
                      text: text,
                      animation: animation,
                      sizeAnimation: 0.8,
                    ),
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

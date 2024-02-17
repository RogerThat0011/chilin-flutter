import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/screens/login/login.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //IMAGE
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height:TSizes.spaceBtwItems),
              
              //TITLE AND SUBTITLE

              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height:TSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height:TSizes.spaceBtwItems),
            
              //BUTTONS
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(TTexts.tContinue))),

            ],
          ),
        ),
      ),
    );
  }
}
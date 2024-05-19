import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_styles.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen(
      {super.key,
      required this.animation,
      required this.title,
      required this.subTitle,
      required this.sizeAnimation,
      required this.onPressed});

  final String animation, title, subTitle;
  double sizeAnimation = 0.2;
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
            const SizedBox(height: TSizes.spaceBtwItems),

            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Lottie.asset(animation,
                  width: MediaQuery.of(context).size.width * sizeAnimation),
              //child: Image(
              //  image: AssetImage(image),
              //width: 150,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const SizedBox(height: TSizes.spaceBtwItems),

            //TITLE AND SUBTITLE

            Text(title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(subTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),

            //BUTTONS
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(TTexts.tContinue))),
          ],
        ),
      ),
    ));
  }
}

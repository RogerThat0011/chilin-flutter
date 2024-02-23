import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../products/product_cards/rounded_cointainer.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: RoundedContainer(
    height: 100,
    padding: const EdgeInsets.all(TSizes.md),
    margin: const EdgeInsets.only(right: TSizes.sm),
    backgroundColor: THelperFunctions.isDarkMode(context)
        ? TColors.darkerGrey
        : TColors.light,
    child: Image(
        fit: BoxFit.contain, image: AssetImage(image)),
  ));
}
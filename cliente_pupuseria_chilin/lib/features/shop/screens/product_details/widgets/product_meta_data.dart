import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:t_store/common/widgets/products/product_cards/rounded_cointainer.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //PRICE
        const Row(
          children: [
            ProductPriceText(price: '1.50', isLarge: true),
          ],
        ),

        //TITLE
        const SizedBox(height: TSizes.spaceBtwItems),
        const ProductTitleText(title: 'Pupusa de frijol con queso'),
        const SizedBox(height: TSizes.spaceBtwItems),
        //STACK STATUS
        Row(
          children: [
            const ProductTitleText(title: 'Estado: '),
            Text('Disponible', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        const SizedBox(height: TSizes.spaceBtwItems),
        //CATEGORY
        const Row(
          children: [
            /*CircularImage(
                image: TImages.pupusaIcon,
                width: 32,
                height: 32,
                overlayColor: dark ? TColors.white : TColors.black),*/
            BrandtitleWithVerifiedIcon(
                title: 'Categoria: Pupusas Tradicionales',
                brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}

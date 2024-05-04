import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //PRICE
         Row(
          children: [
            ProductPriceText(price: product.precio.toString(), isLarge: true),
          ],
        ),

        //TITLE
        const SizedBox(height: TSizes.spaceBtwItems),
        ProductTitleText(title: product.nombre),
        const SizedBox(height: TSizes.spaceBtwItems),
        //STACK STATUS
        Row(
          children: [
            const ProductTitleText(title: 'Estado: '),
            Text(product.estado, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        const SizedBox(height: TSizes.spaceBtwItems),
        //CATEGORY
        Row(
          children: [
            BrandtitleWithVerifiedIcon(
                title: 'Categoría: ${product.nombreCategoria}',
                brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /*RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price : ', smallSize: true),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: TSizes.spaceBtwItems),

                          //SALE PRICE
                          const ProductTitleText(title: '20')
                        ],
                      ),
                      //STOCK
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                      //VARIATION DESCRIPTION
                      const ProductTitleText(
                          title: 'Basic Description of the product',
                          smallSize: true,
                          maxLines: 4),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        //ATTRIBUTES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChipProduct(
                    text: 'Green', selected: true, onSelected: (value) {}),
                ChoiceChipProduct(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                ChoiceChipProduct(
                    text: 'Yellow', selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),*/

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Tipo de Masa',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChipProduct(
                    text: 'Arroz', selected: true, onSelected: (value) {}),
                ChoiceChipProduct(
                    text: 'Maiz', selected: true, onSelected: (value) {})
              ],
            )
          ],
        )
      ],
    );
  }
}

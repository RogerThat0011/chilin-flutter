import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DROPDOWN
        DropdownButtonFormField(
          items: [
            'Nombre',
            'Mayor Precio',
            'Menor Precio',
            'Nuevos',
            'Populares'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //PRODUCTS
        GridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => ProductCardVertical(product: ProductModel.empty()))
      ],
    );
  }
}

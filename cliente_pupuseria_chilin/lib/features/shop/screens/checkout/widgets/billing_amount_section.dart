import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAmountSecion extends StatelessWidget {
  const BillingAmountSecion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$8.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        /*const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),*/
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Propina de app', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$0.50', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total a pagar', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$8.50', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

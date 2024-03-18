import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_cards/rounded_cointainer.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          padding: const EdgeInsets.all(TSizes.sm),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? TColors.darkerGrey
                  : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(selectedAddress ? Iconsax.tick_circle : null,
                    color: selectedAddress
                        ? dark
                            ? TColors.light
                            : TColors.dark
                        : null),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: TSizes.sm / 2),
                  Text('+503${address.phoneNumber}',
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                    address.toString(),
                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

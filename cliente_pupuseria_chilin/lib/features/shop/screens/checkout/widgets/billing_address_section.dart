import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
                title: 'Datos del cliente',
                buttonTitle: 'Cambiar',
                onPressed: () =>
                    addressController.selectedNewAddressPopup(context)),
            if (addressController.selectedAddress.value.id.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(addressController.selectedAddress.value.name,
                          style: Theme.of(context).textTheme.bodyLarge),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey, size: 16),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                              '+503 ${addressController.selectedAddress.value.phoneNumber}',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Row(
                        children: [
                          const Icon(Icons.location_history,
                              color: Colors.grey, size: 16),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                              '${addressController.selectedAddress.value.municipality}, ${addressController.selectedAddress.value.department}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true)
                        ],
                      ),
                    ],
                  )
            else
              Text('Selecciona una Direccion',
                  style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

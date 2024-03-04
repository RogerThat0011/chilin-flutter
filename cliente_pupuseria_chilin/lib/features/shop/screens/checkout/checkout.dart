import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/product_cards/rounded_cointainer.dart';
import 'package:t_store/common/widgets/success_screen/succes_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Detalle de la orden',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //COUPON
              //const CouponCode(),
              //const SizedBox(height: TSizes.spaceBtwSections),

              //BILLING SECTION
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    //PRICING
                    BillingAmountSecion(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //DIVIDER
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //PAYMENT
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //ADDRESS
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      //CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.ordenExitosa,
                title: '¡Orden realizada con exito!',
                subTitle: 'Pronto te notificaremos cuando tu pedido este listo para retirarlo en la pupuseria.',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text('Confirmar Orden \$8.50'),
        ),
      ),
    );
  }
}

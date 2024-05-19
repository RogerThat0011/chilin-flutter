import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/animation_loader.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text('Carrito',
                style: Theme.of(context).textTheme.headlineSmall)),
        body: Obx(
          () {
            final emptyWidget = AnimationLoaderWidget(
              text: '¡Vaya! Tu carrito está vacío.',
              animation: TImages.newCartAnimation,
              sizeAnimation: 0.2,
            );

            if (controller.cartItems.isEmpty) {
              return emptyWidget;
            } else {
              return const Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: TCartItems(),
              );
            }
          },
        ),
        bottomNavigationBar: controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() => Text(
                      'Realizar Orden \$${controller.totalCartPrice.value}')),
                ),
              ),
      ),
    );
  }
}

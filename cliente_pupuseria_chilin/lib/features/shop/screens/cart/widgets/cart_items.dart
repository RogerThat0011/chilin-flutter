import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];

          return Column(
            children: [
              TCartItem(cartItem: item),
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        //REMOVE BUTTON & ADD BUTTON
                        ProductQuantityWithAddRemove(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () =>
                                cartController.removeOneFromCart(item)),
                      ],
                    ),
                    ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}

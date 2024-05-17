import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/order_controller.dart';
import '../../../models/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();
    final dark = THelperFunctions.isDarkMode(context);

    Future<List<OrderModel>>? userOrders;
    userOrders ??= orderController.fetchUserOrders();

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Detalle de la orden'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: FutureBuilder<List<OrderModel>>(
          future: userOrders,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Error al intentar obtener las ordenes'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final orders = snapshot.data!;
            final order = orders.firstWhere((order) => order.id == orderId);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(title: "    Orden:  ${orderId}", maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(
                    title: "    Estado:  ${order.orderStatusText}",
                    maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(
                    title: "    Fecha:  ${order.formattedOrderDate}",
                    maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                Expanded(
                  child: ListView.builder(
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      final item = order.items[index];
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TRoundedImage(
                              imageUrl: item.image ?? '',
                              width: 60,
                              height: 60,
                              isNetworkImage: true,
                              padding: const EdgeInsets.all(TSizes.sm),
                              backgroundColor:
                                  dark ? TColors.darkerGrey : TColors.light,
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BrandtitleWithVerifiedIcon(
                                    title: "  ${item.categoryName}"),
                                ProductTitleText(
                                    title: "  ${item.title}", maxLines: 1),
                                Text(
                                  '  Precio: \$${item.price} x ${item.quantity}',
                                ),
                              ],
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ProductTitleText(
                    title: "    Total del pedido:  \$   ${order.totalAmount}",
                    maxLines: 1)
              ],
            );
          },
        ),
      ),
    );
  }
}

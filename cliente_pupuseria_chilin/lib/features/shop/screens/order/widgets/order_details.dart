import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';
import '../../../models/order_model.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Detalle de la orden'),
      ),
      body: FutureBuilder<List<OrderModel>>(
        future: orderController.fetchUserOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al intentar obtener las ordenes'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final orders = snapshot.data!;
          final order = orders.firstWhere((order) => order.id == orderId);

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(title: "Orden: ${orderId}", maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(title: "Estado: ${order.orderStatusText}", maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProductTitleText(title: "Fecha: ${order.formattedOrderDate}", maxLines: 1),
                const SizedBox(height: TSizes.spaceBtwItems),
                Expanded(
                  child: ListView.builder(
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      final item = order.items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TRoundedImage(
                              imageUrl: item.image ?? '',
                              width: 100,
                              height: 100,
                              isNetworkImage: true,
                              padding: const EdgeInsets.all(TSizes.sm),
                              backgroundColor: dark ? TColors.darkerGrey : TColors.light,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BrandtitleWithVerifiedIcon(
                                    title: '${item.categoryName}',
                                    brandTextSize: TextSizes.large,
                                  ),
                                  const SizedBox(height: 4),
                                  ProductTitleText(title: item.title, maxLines: 1),
                                  const SizedBox(height: 4),
                                  ProductTitleText(title: 'Precio: \$${item.price}'),
                                  const SizedBox(height: 4),
                                  ProductTitleText(title: 'Cantidad: ${item.quantity}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10), // Agrega un espacio entre los elementos
                ProductTitleText(title: 'Metodo de pago: ${order.paymentMethod}'),
                const SizedBox(height: 10), // Agrega un espacio entre los elementos
                const ProductTitleText(title: 'Propina por la app: \$0.50'), // Agrega la sección de la propina
                const SizedBox(height: 10), // Agrega un espacio entre los elementos
                ProductTitleText(title: "Total del pedido: \$${order.totalAmount}", maxLines: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}

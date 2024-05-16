import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu2.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
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

    //
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Información del pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
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
                const TSectionHeading(
                    title: 'Detalles del pedido', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProfileMenu2(
                    title: 'Orden ID: ', value: "${orderId}", onPressed: () {}),
                ProfileMenu2(
                    title: 'Estado:',
                    value: "${order.orderStatusText}",
                    onPressed: () {}),
                ProfileMenu2(
                    title: 'Fecha: ',
                    value: "${order.formattedOrderDate}",
                    onPressed: () {}),
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

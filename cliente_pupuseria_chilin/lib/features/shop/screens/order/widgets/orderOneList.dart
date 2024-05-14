import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu2.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/order_controller.dart';
import '../../../models/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  OrderDetailsScreen({required this.orderId});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();

    Future<List<OrderModel>>? userOrders;
    userOrders ??= orderController.fetchUserOrders();

    //
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Detalles del pedido'),
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
                    title: 'Información del pedido', showActionButton: false),
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

              /*  Expanded(

                  child: ListView.builder(
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      final item = order.items[index];
                      return ListTile(

                        subtitle: Text(
                            'Cantidad: ${item.quantity}, Precio: \$${item.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ), */
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/succes_screen.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/repositories/orders/orders_respository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/enum/enums.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Procesando tu orden...', TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now());

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => SuccessScreen(
            image: TImages.successImageWhenAllIsOk,
            title: '¡Orden realizada con exito!',
            subTitle:
                'Pronto te notificaremos cuando tu pedido este listo para retirarlo en la pupuseria.',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));

    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }
}

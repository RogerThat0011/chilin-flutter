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

  var orders = <OrderModel>[].obs;

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  Future<List<OrderModel>> fetchUserOrdersForDetails() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
      return [];
    }
  }

  Future<void> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      orders.value = userOrders;
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
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
        animation: TImages.paymentSuccesfulAnimation,
        title: '¡Orden realizada con exito!',
        subTitle:
        'Pronto te notificaremos cuando tu pedido este listo para retirarlo en la pupuseria.',
        sizeAnimation: 0.8,
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));

    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }

  Future<void> cancelOrder(String userId, String orderId) async {
    try {
      final order = await orderRepository.getOrder(userId, orderId);

      if (order != null) {
        final orderStatus = order.status;
        final orderDate = order.orderDate;

        if (orderStatus == OrderStatus.canceled) {
          Loaders.warningSnackBar(title: 'La orden ya está cancelada.');
          return;
        }

        if (orderStatus == OrderStatus.finished) {
          Loaders.warningSnackBar(title: 'La orden ya está finalizada y no se puede cancelar.');
          return;
        }

        final now = DateTime.now();
        final diff = now.difference(orderDate).inMinutes;

        if (diff > 20) {
          Loaders.warningSnackBar(title: 'Han pasado más de 20 minutos desde que se realizó la orden y no se puede cancelar.');
          return;
        }

        await orderRepository.orderToCancel(userId, orderId);

        Loaders.warningSnackBar(title: 'La orden $orderId se ha cancelado correctamente.');

        await fetchUserOrders();

      } else {
        Loaders.warningSnackBar(title: 'No se encontró la orden con el ID especificado.');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrió un error!', message: e.toString());
    }
  }
}

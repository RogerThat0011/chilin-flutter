
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/enum/enums.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      Loaders.customToast(message: 'Selecciona una cantidad');
      return;
    }

    // Verifica si se han seleccionado atributos para productos con atributos
    if (product.productAttributes != null &&
        product.productAttributes!.isNotEmpty &&
        variationController.selectedAttributes.isEmpty) {
      Loaders.customToast(message: 'Selecciona el tipo de masa');
      return;
    }

    // Obtiene los atributos seleccionados específicamente para este producto
    String productId = product.id;
    Map<dynamic, dynamic>? attributes = variationController.selectedAttributes[productId];

    // Busca un elemento similar en el carrito
    CartItemModel? existingItem = cartItems.firstWhereOrNull(
            (item) => item.productId == productId && _attributesEqual(item.selectedAttribute, attributes));

    if (existingItem != null) {
      // Si el elemento ya existe, simplemente actualiza la cantidad
      existingItem.quantity += productQuantityInCart.value;
    } else {
      // Crea un nuevo objeto CartItemModel
      final selectedCartItem = convertToCartItem(
        product,
        productQuantityInCart.value,
        attributes,
      );

      // Agrega los atributos seleccionados al producto específico en el carrito
      variationController.selectedAttributes.remove(productId);

      // Agrega el producto al carrito
      cartItems.add(selectedCartItem);
    }

    // Actualiza el carrito
    updateCart();
    Loaders.customToast(message: '¡El producto ha sido agregado a tu carrito!');
  }

  bool _attributesEqual(Map<dynamic, dynamic>? attributes1, Map<dynamic, dynamic>? attributes2) {
    if (attributes1 == null && attributes2 == null) {
      return true;
    }
    if (attributes1 == null || attributes2 == null) {
      return false;
    }
    return attributes1.toString() == attributes2.toString();
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Eliminar Producto',
      middleText: '¿Estas seguro de eliminar el producto?',
      textCancel: 'Cancelar',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(
            message: 'El producto fue eliminado de tu carrito.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  CartItemModel convertToCartItem(
      ProductModel product, int quantity, Map<dynamic, dynamic>? attributes) {
    return CartItemModel(
      productId: product.id,
      title: product.nombre,
      categoryName: product.nombreCategoria,
      quantity: quantity,
      price: product.precio,
      image: product.image,
      selectedAttribute:
          attributes != null && attributes.isNotEmpty ? attributes : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemsStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemsStrings);
  }

  void loadCartItems() {
    final cartItemsStrings =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsStrings != null) {
      cartItems.assignAll(cartItemsStrings
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }
  }
}

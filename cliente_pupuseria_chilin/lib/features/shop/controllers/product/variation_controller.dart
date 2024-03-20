import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap<String, Map<dynamic, dynamic>> selectedAttributes = <String, Map<dynamic, dynamic>>{}.obs;

  void selectAttribute(String productId, String? attributeName, dynamic attributeValue) {
    if (!selectedAttributes.containsKey(productId)) {
      selectedAttributes[productId] = {};
    }
    selectedAttributes[productId]![attributeName] = attributeValue;
  }

  void resetSelectedAttributes(String productId) {
    selectedAttributes.remove(productId);
  }
}

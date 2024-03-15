import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  Rx<ProductAttributeModel> selectedVariation = ProductAttributeModel.empty().obs;

  RxMap selectedAttributes = {}.obs;

  void selectAttribute(String? attributeName, dynamic attributeValue) {
    selectedAttributes[attributeName] = attributeValue;
  }
}

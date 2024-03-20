import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(
                title: attribute.nombre ?? '',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Obx(() => Wrap(
                spacing: 8,
                children: attribute.values!.map((tipo) {
                  final isSelected = controller.selectedAttributes[product.id]?.containsKey(attribute.nombre) == true &&
                      controller.selectedAttributes[product.id]![attribute.nombre] == tipo;
                  return ChoiceChipProduct(
                    text: tipo,
                    selected: isSelected,
                    onSelected: (value) {
                      if (isSelected) {
                        // Si ya está seleccionado, deselecciona este atributo
                        controller.resetSelectedAttributes(product.id);
                      } else {
                        // Si no está seleccionado, selecciona solo este atributo
                        controller.resetSelectedAttributes(product.id);
                        controller.selectAttribute(product.id, attribute.nombre, tipo);
                      }
                    },
                  );
                }).toList(),
              )),
            ],
          ))
              .toList(),
        ),
      ],
    );
  }
}

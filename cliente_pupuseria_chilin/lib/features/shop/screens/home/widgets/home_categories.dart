import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/shimmers/category_shimmer.dart';

import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categoryController = Get.put(CategoryController());

    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      (){
        if(categoryController.isLoading.value) return const CategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('¡No hay categorias a mostrar!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const BrandProducts()),
              );
            },
          ),
        );
      }
    );
  }
}
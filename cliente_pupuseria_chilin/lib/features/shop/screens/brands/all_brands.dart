import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/shimmers/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Get.put(CategoryController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //HEADING
              const TSectionHeading(
                  title: 'Categorias', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              //CATEGORIES
              Obx(
                () {
                  if (categories.isLoading.value) return const BrandShimmer();

                  if (categories.allCategories.isEmpty) {
                    return Center(
                        child: Text('No hay categorias a mostrar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)));
                  }
                  return GridLayout(
                      itemCount: categories.allCategories.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final category = categories.allCategories[index];
                        return BrandCard(
                          showBorder: true,
                          onTap: () => Get.to(() => BrandProducts(category: category)),
                          category: category,
                          numberProducts: categories.allCategories.length,
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

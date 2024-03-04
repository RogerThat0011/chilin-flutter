import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //APPBAR
                  THomeAppBar(),
                  //SEARCH BAR

                  SizedBox(height: TSizes.spaceBtwSections),

                  TSearchContainer(
                    text: 'Buscar en la tienda',
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),

                  //CATEGORIES
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                            title: 'Categorias Populares',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //SCROLL
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.bannerChilin1,
                    TImages.bannerChilin2,
                    TImages.bannerChilin3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Productos Populares', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //PRODUCTS
                  GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

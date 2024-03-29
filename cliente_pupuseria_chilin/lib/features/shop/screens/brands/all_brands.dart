import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //HEADING
              const TSectionHeading(title: 'Categorias', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              //BRANDS
              GridLayout(
                  itemCount: 20,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => BrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      )
              )
            ],
          ),
        ),
      ),
    );
  }
}

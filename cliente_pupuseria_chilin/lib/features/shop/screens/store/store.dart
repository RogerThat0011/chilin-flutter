import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/products/product_cards/rounded_cointainer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/enums.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //SEARCH BAR
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackgrund: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      //BRANDS
                      TSectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      GridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index){
                        return GestureDetector(
                        onTap: (){},
                        child: RoundedContainer(
                          padding: const EdgeInsets.all(TSizes.sm),
                          showBorder: true,
                          backgroundColor: Colors.transparent,
                          child: Row(
                            children: [
                              //ICON
                              Flexible(
                                child: CircularImage(
                                  isNetworkImage: false,
                                  image: TImages.clothIcon,
                                  backgroundColor: Colors.transparent,
                                  overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems / 2),
                        
                              //TEXT
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [    
                                    const BrandtitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                    Text(
                                      '256 products',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                      })
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
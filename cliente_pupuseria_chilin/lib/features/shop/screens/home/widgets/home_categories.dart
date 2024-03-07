import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';

import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.pupusaIcon,
           // image: AssetImage(dark ? TImages.pupusaIcon : TImages.pupusaIconBlanca),
            //pupusaIconBlanca
            title: 'Pupusas',
            onTap: () => Get.to(() => const BrandProducts()),
          );
        },
      ),
    );
  }
}
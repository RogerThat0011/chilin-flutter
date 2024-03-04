import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: const Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding:
                      EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                          image: AssetImage(TImages.productPupusas))),
                )),
    
            //SLIDER IMAGE
            /*Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => TRoundedImage(
                        width: 80,
                        backgroundColor:
                            dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.productImage3),
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: TSizes.spaceBtwItems),
                    itemCount: 4),
              ),
            ),*/
    
            //APPBAR
            TAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
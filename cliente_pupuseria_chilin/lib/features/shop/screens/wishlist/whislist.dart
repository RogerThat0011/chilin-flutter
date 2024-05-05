import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/popups/animation_loader.dart';
import 'package:t_store/utils/shimmers/vertical_product_shimmer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Favoritos',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = AnimationLoaderWidget(
                        text: '¡No has agregado nada a tus favoritos!',
                        animation: TImages.pencilAnimation,
                        sizeAnimation: 0.8,
                        onActionPressed: () =>
                            Get.to(() => const NavigationMenu()),
                      );

                      const loader = VerticalProductShimmer(itemCount: 6);
                      final widget = CloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return GridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              ProductCardVertical(product: products[index]));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

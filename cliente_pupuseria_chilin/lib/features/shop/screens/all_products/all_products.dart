import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_items.dart';
import 'package:t_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmers/vertical_product_shimmer.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, this.query, this.futureMethod});

  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar:
          const TAppBar(title: Text('Productos Populares'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = VerticalProductShimmer();

              final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              if(widget != null) return widget;

              final products = snapshot.data!;

              return SortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: TAppBar(
            title: Text('Tienda',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: const [
              TCartCounterIcon(),
            ],
          ),
          body: const AllBrandsScreen()),
    );
  }
}

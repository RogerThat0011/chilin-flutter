import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = TLocalStorage.instance().readData('favoritos');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId){
    print('ENTRANDO AL METODO TOGGLE FAVOURITE');
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      Loaders.customToast(message: '¡El producto ha sido agregado a Favoritos!');
    }else{
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      Loaders.customToast(message: '¡El producto ha sido eliminado de Favoritos!');
    }
  }

  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favoritos', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}

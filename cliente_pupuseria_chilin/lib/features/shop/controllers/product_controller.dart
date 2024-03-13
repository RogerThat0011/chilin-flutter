
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ProductController extends GetxController{

  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async{
    try{
      isLoading.value = true;

      //FETCH PRODUCTS
      final products = await productRepository.getFeaturedProducts();

      //ASSIGN PRODDUCTS
      featuredProducts.assignAll(products);
    }catch(e){
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}
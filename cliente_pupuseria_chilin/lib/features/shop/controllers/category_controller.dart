
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final categoryRepository = Get.put(CategoryRepository());

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //LOAD CATEGORY
  Future<void> fetchCategories() async{
    try{
      isLoading.value = true;

      final categories = await categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch(e){
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  //GET PRODUCTS OF A SPECIFIC CATEGORY
  Future<List<ProductModel>> getCategoryProducts(String categoryId) async{
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId);
      return products;
    }catch(e){
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
      return [];
    }
  }

  Future<int> getCategoryProductsCount(String categoryId) async {
    try {
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId);
      return products.length;
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrió un error!', message: e.toString());
      return 0;
    }
  }
}
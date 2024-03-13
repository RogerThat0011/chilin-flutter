
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
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

  //LOAD SELECTED CATEGORY

  //GET CATEGORY OR SUB-CATEGORY
}
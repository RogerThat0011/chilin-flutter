import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Productos')
          .where('isFeatured', isEqualTo: true)
          .where('estado', isEqualTo: 'Disponible')
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Productos')
          .where('isFeatured', isEqualTo: true)
          .where('estado', isEqualTo: 'Disponible')
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Productos')
              .where('idCategoria', isEqualTo: categoryId)
              .where('estado', isEqualTo: 'Disponible')
              .get()
          : await _db
              .collection('Productos')
              .where('idCategoria', isEqualTo: categoryId)
              .where('estado', isEqualTo: 'Disponible')
              .limit(limit)
              .get();

      final products =
          querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productId) async {
    try {
      final snapshot = await _db
          .collection('Productos')
          .where(FieldPath.documentId, whereIn: productId)
          .where('estado', isEqualTo: 'Disponible')
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/shop/models/order_model.dart';

class OrderRepository extends GetxController{

  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async{
    try{

      final userId = AuthenticationRepository.instance.authUser?.uid;
      if(userId!.isEmpty) throw 'No pudimos encontrar la informacion del usuario. Por favor intente más tarde';

      final result = await _db.collection('Usuarios').doc(userId).collection('Ordenes').get();
      return result.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
    }catch(e){
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async{
    try{
      await _db.collection('Usuarios').doc(userId).collection('Ordenes').add(order.toJson());
    }catch(e){
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController{

  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAdresses() async{
    try{

      final userId = AuthenticationRepository.instance.authUser!.uid;

      if(userId.isEmpty) throw 'No hemos encontrado informacion del usuario';

      final result = await _db.collection("Usuarios").doc(userId).collection('Direcciones').get();

      return result.docs.map((document) => AddressModel.fromDocumentSnapshot(document)).toList();

    }catch(e){
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Usuarios').doc(userId).collection('Direcciones').doc(addressId).update({'isSelected': selected});
    }catch(e){
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }

  Future<String> addAddress(AddressModel address) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection('Usuarios').doc(userId).collection('Direcciones').add(address.toJson());
      return currentAddress.id;
    }catch(e){
      throw 'Ocurrio un error. Por favor intente de nuevo.';
    }
  }
}
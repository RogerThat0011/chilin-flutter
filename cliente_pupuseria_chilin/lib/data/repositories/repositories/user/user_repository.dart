import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //SAVE USER IN FIREBASE
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Usuarios").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }cath(e){
      throw 'Ocurrio un error. Por favor intente de nuevo';
    }
  }

  //FETCH USER DETAILS
  Future<UserModel> fetchUserDetails() async{
    try{
      final document = await _db.collection("Usuarios").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(document.exists){
        return UserModel.fromSnapshot(document);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }cath(e){
      throw 'Ocurrio un error. Por favor intente de nuevo';
    }
  }

  //UPDATE USER
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("Usuarios").doc(updatedUser.id).set(updatedUser.toJson());
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }cath(e){
      throw 'Ocurrio un error. Por favor intente de nuevo';
    }
  }

  //UPDATE SINGLE FIELD
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection("Usuarios").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }cath(e){
      throw 'Ocurrio un error. Por favor intente de nuevo';
    }
  }

  //REMOVE USER
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Usuarios").doc(userId).delete();
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }cath(e){
      throw 'Ocurrio un error. Por favor intente de nuevo';
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{

  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = ''
  });

  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  Map<String, dynamic> toJson() {
    return{
      'nombre': name,
      'imagen': image,
      'parentId': parentId,
      'isFeatured': isFeatured
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;

      return CategoryModel(
        id: document.id,
        name: data['nombre'] ?? '',
        image: data['imagen'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false
      );
    }else{
      return CategoryModel.empty();
    }
  }
}
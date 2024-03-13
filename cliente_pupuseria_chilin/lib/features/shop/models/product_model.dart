import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';

class ProductModel {
  String id;
  String estado;
  String? descripcion;
  String? idCategoria;
  String image;
  String nombre;
  bool? isFeatured;
  double precio;
  List<ProductAttributeModel>? productAttributes;

  ProductModel(
      {required this.id,
      required this.estado,
      required this.image,
      required this.nombre,
      required this.precio,
      this.descripcion,
      this.idCategoria,
      this.isFeatured,
      this.productAttributes});

  static ProductModel empty() =>
      ProductModel(id: '', estado: '', image: '', nombre: '', precio: 0.0);

  toJson() {
    return {
      'estado': estado,
      'descripcion': descripcion,
      'idCategoria': idCategoria,
      'imagen': image,
      'nombre': nombre,
      'isFeatured': isFeatured,
      'precio': precio,
      'attributosProducto': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : []
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {

    if(document.data() == null) return ProductModel.empty();

    final data = document.data()!;
    return ProductModel(
        id: document.id,
        estado: data['estado'],
        image: data['imagen'] ?? '',
        nombre: data['nombre'],
        precio: data['precio'],
        descripcion: data['descripcion'] ?? '',
        idCategoria: data['idCategoria'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        productAttributes: (data['attributosProducto'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList());
  }
}

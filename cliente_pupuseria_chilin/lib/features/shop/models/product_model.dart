import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';

class ProductModel {
  String id;
  String estado;
  String? descripcion;
  String? idCategoria;
  String nombreCategoria;
  String image;
  String nombre;
  bool? isFeatured;
  double precio;
  String productType;
  List<ProductAttributeModel>? productAttributes;

  ProductModel(
      {required this.id,
      required this.estado,
      required this.image,
      required this.nombre,
      required this.precio,
      required this.nombreCategoria,
      required this.productType,
      this.descripcion,
      this.idCategoria,
      this.isFeatured,
      this.productAttributes});

  static ProductModel empty() => ProductModel(
      id: '',
      estado: '',
      image: '',
      nombre: '',
      precio: 0.0,
      nombreCategoria: '',
      productType: '');

  toJson() {
    return {
      'estado': estado,
      'descripcion': descripcion,
      'idCategoria': idCategoria,
      'nombreCategoria': nombreCategoria,
      'imagen': image,
      'nombre': nombre,
      'isFeatured': isFeatured,
      'precio': precio,
      'tipoProducto': productType,
      'attributosProducto': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : []
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();

    final data = document.data()!;
    final productAttributesData = data['attributosProducto'];
    List<ProductAttributeModel>? productAttributes;

    if (productAttributesData != null) {
      productAttributes = (productAttributesData as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList();
    }

    return ProductModel(
      id: document.id,
      estado: data['estado'],
      image: data['imagen'] ?? '',
      nombre: data['nombre'],
      precio: double.parse((data['precio'] ?? 0.0).toString()),
      descripcion: data['descripcion'] ?? '',
      idCategoria: data['idCategoria'] ?? '',
      nombreCategoria: data['nombreCategoria'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productType: data['tipoProducto'] ?? '',
      productAttributes: productAttributes,
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    final productAttributesData = data['attributosProducto'];
    List<ProductAttributeModel>? productAttributes;

    if (productAttributesData != null) {
      productAttributes = (productAttributesData as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList();
    }

    return ProductModel(
      id: document.id,
      estado: data['estado'],
      image: data['imagen'] ?? '',
      nombre: data['nombre'],
      precio: double.parse((data['precio'] ?? 0.0).toString()),
      descripcion: data['descripcion'] ?? '',
      idCategoria: data['idCategoria'] ?? '',
      nombreCategoria: data['nombreCategoria'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productType: data['tipoProducto'] ?? '',
      productAttributes: productAttributes,
    );
  }
}

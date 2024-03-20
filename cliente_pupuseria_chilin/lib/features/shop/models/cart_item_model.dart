import 'package:t_store/features/shop/models/product_attribute_model.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String? categoryName;
  Map<dynamic, dynamic>? selectedAttribute;

  CartItemModel(
      {required this.productId,
      required this.quantity,
      this.image,
      this.price = 0.0,
      this.title = '',
      this.categoryName,
      this.selectedAttribute});

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'idProducto': productId,
      'titulo': title,
      'precio': price,
      'image': image,
      'cantidad': quantity,
      'categoria': categoryName,
      'atributos': selectedAttribute
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final selectedAttributeJson = json['atributos'];

    Map<dynamic, dynamic>? selectedAttribute;
    if (selectedAttributeJson != null) {
      selectedAttribute = Map.from(selectedAttributeJson);
    }

    return CartItemModel(
        productId: json['idProducto'],
        title: json['titulo'],
        price: json['precio'],
        image: json['image'],
        quantity: json['cantidad'],
        categoryName: json['categoria'],
        selectedAttribute: selectedAttribute);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/enum/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Efectivo',
    this.address,
    this.deliveryDate
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate =>
      deliveryDate != null
          ? THelperFunctions.getFormattedDate(deliveryDate!)
          : '';

  String get orderStatusText =>
      status == OrderStatus.delivered
          ? 'Entregado'
          : status == OrderStatus.shipped
          ? 'Listo'
          : 'En Cocina';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUsuario': userId,
      'estado': status.toString(),
      'montoTotal': totalAmount,
      'fechaOrden': orderDate,
      'metodoPago': paymentMethod,
      'direccion': address?.toJson(),
      'fechaEntrega': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: data['id'] as String,
        userId: data['idUsuario'] as String,
        status: OrderStatus.values.firstWhere((e) => e.toString() == data['estado']),
        totalAmount: data['montoTotal'] as double,
        orderDate: (data['fechaOrden'] as Timestamp).toDate(),
        paymentMethod: data['metodoPago'] as String,
        address: AddressModel.fromMap(data['direccion'] as Map<String, dynamic>),
        deliveryDate: data['fechaEntrega'] == null ? null : (data['fechaEntrega'] as Timestamp).toDate(),
        items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList(),
    );
  }
}
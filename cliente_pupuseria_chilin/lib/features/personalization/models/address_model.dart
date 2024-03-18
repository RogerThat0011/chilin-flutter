import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {

  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String municipality;
  final String department;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.municipality,
    required this.department,
    this.country = "El Salvador",
    this.dateTime,
    this.selectedAddress = true
  });

  static AddressModel empty() =>
      AddressModel(id: '',
          name: '',
          phoneNumber: '',
          street: '',
          postalCode: '',
          municipality: '',
          department: '');

  Map<String, dynamic> toJson() {
    return {
      'nombre': name,
      'numeroTelefono': phoneNumber,
      'calle': street,
      'codigoPostal': postalCode,
      'municipio': municipality,
      'departamento': department,
      'pais': country,
      'fecha': DateTime.now(),
      'isSelected': selectedAddress
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data){
    return AddressModel(
        id: data['id'] as String,
        name: data['nombre'] as String,
        phoneNumber: data['numeroTelefono'] as String,
        street: data['calle'] as String,
        postalCode: data['codigoPostal'] as String,
        municipality: data['municipio'] as String,
        department: data['departamento'] as String,
        country: data['pais'] as String,
        dateTime: (data['fecha'] as Timestamp).toDate(),
        selectedAddress: data['isSelected'] as bool
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
        id: snapshot.id,
        name: data['nombre'] ?? '',
        phoneNumber: data['numeroTelefono'] ?? '',
        street: data['calle'] ?? '',
        postalCode: data['codigoPostal'] ?? '',
        municipality: data['municipio'] ?? '',
        department: data['departamento'] ?? '',
        country: data['pais'] ?? '',
        dateTime: (data['fecha'] as Timestamp).toDate(),
        selectedAddress: data['isSelected'] as bool
    );
  }

  @override
  String toString() {
    return '$street, $municipality, $department, $postalCode, $country';
  }
}
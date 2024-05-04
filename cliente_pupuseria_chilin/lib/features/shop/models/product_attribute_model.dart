class ProductAttributeModel {
  String? nombre;
  final List<String>? values;

  ProductAttributeModel({this.nombre, this.values});

  toJson(){
    return{
      'nombre': nombre,
      'valor': values
    };
  }

  static ProductAttributeModel empty() => ProductAttributeModel(nombre: '', values: []);

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document){
    final data = document;

    if(data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      nombre: data.containsKey('nombre') ? data['nombre'] : '',
      values: List<String>.from(data['valor']),
    );
  }
}

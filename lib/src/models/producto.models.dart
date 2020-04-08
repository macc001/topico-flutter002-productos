class ProductoModel {
  String id;
  double cantidad;
  String descripcion;
  int idprod;
  String nombre;
  double precio;

  ProductoModel({
    this.id,
    this.cantidad,
    this.descripcion,
    this.idprod,
    this.nombre,
    this.precio,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        cantidad: json["cantidad"],
        descripcion: json["descripcion"],
        idprod: json["idprod"],
        nombre: json["nombre"],
        precio: json["precion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "descripcion": descripcion,
        "idprod": idprod,
        "nombre": nombre,
        "precion": precio,
      };
}

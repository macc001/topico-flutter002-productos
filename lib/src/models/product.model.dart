import 'package:firebase_database/firebase_database.dart';

class ProductModel {
  String id;
  double cantidad;
  String descripcion;
  String nombre;
  double precio;

  ProductModel(
      this.id, this.cantidad, this.descripcion, this.nombre, this.precio);

  ProductModel.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        cantidad = snapshot.value["cantidad"],
        descripcion = snapshot.value["descripcion"],
        nombre = snapshot.value["nombre"],
        precio = snapshot.value["precio"];

  toJson() {
    return {
      "cantidad": cantidad,
      "descripcion": descripcion,
      "nombre": nombre,
      "precio": precio,
    };
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:practica2/src/models/producto.models.dart';

class ProductoProvider with ChangeNotifier {
  DatabaseReference itemRef;
  List<ProductoModel> items = List();

  ProductoProvider() {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('productos');
    itemRef.onChildChanged.listen(_onEntryChanged);
    this.getProducto(1, 5);
  }

  _onEntryChanged(Event event) {
    print("cambios");
    //  this.getProducto(1, 5);
  }

  Future<List<ProductoModel>> getProducto(int start, int cant) async {
    for (int i = 0; i < 10; i++) {
      // items.add(new ProductoModel({id:"12"});
    }
    return items;
  }
}

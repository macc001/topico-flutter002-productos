import 'package:flutter/material.dart';
import 'package:practica2/src/models/product.model.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductoProvider with ChangeNotifier {
  List<ProductModel> items = List();
  ProductModel item;
  DatabaseReference itemRef;

  ProductoProvider() {
    item = ProductModel("", 0, "", "", 0);
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('productos');
    itemRef.onChildAdded.listen(_onAdded);
    itemRef.onChildChanged.listen(_onChanged);
    itemRef.onChildRemoved.listen(_onDeleted);
  }

  _onAdded(Event event) {
    items.add(ProductModel.fromSnapshot(event.snapshot));
    notifyListeners();
  }

  _onChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.id == event.snapshot.key;
    });
    items[items.indexOf(old)] = ProductModel.fromSnapshot(event.snapshot);
    notifyListeners();
  }

  _onDeleted(Event event) {
    var old = items.singleWhere((entry) {
      return entry.id == event.snapshot.key;
    });
    items.removeAt(items.indexOf(old));
    notifyListeners();
  }
}

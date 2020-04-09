import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:practica2/src/models/product.model.dart';

class Product extends StatefulWidget {
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> {
  List<ProductModel> items = List();
  ProductModel item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = ProductModel("", 0, "", "", 0);
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('productos');
    itemRef.onChildAdded.listen(_onAdded);
    itemRef.onChildChanged.listen(_onChanged);
    itemRef.onChildRemoved.listen(_onDeleted);
  }

  _onAdded(Event event) {
    setState(() {
      items.add(ProductModel.fromSnapshot(event.snapshot));
    });
  }

  _onChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.id == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = ProductModel.fromSnapshot(event.snapshot);
    });
  }

  _onDeleted(Event event) {
    var old = items.singleWhere((entry) {
      return entry.id == event.snapshot.key;
    });
    setState(() {
      items.removeAt(items.indexOf(old));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: 35,
          ),
          onPressed: null,
        ),
        title: Text('Productos'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 35,
            ),
            onPressed: null,
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new ListTile(
                  leading: Text(
                    items[index].cantidad.toString(),
                  ),
                  title: Text(items[index].nombre),
                  subtitle: Text(items[index].descripcion),
                  trailing: Text(
                    items[index].precio.toString() + " Bs",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practica2/src/provider/producto_provider.dart';
// import 'package:practica2/src/pages/ListaProducto.dart';

class ProductoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductoPageState();
  }
}

class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica2'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => ProductoProvider(),
        child: ListaProducto(),
      ),
    );
  }
}

class ListaProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductoProvider>(
        builder: (context, ProductoProvider value, Widget child) {
          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text("$index - ${value.items[index]}"),
              );
            },
          );
        },
      ),
    );
  }
}

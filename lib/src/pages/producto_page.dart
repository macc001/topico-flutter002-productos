import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practica2/src/provider/producto_provider.dart';

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
      appBar: appBar(),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => ProductoProvider(),
        child: ListaProducto(),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
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
    );
  }
  //
}

class ListaProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaProductoState();
  }
}

class _ListaProductoState extends State<ListaProducto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductoProvider>(
        builder: (context, ProductoProvider value, Widget child) {
          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, int index) {
              return ListTile(
                leading: Text("${value.items[index].cantidad}"),
                title: Text("${value.items[index].nombre}"),
                subtitle: Text("${value.items[index].descripcion}"),
                trailing: Text(
                  "${value.items[index].precio} Bs",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.blue),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practica2/src/models/producto.models.dart';
import 'package:practica2/src/provider/producto_provider.dart';

class ProductoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductoPageState();
  }
}

class _ProductoPageState extends State<ProductoPage> {
  int _selectOption = 0;
  final prodProvider = new ProductoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica2'),
        centerTitle: true,
      ),
      body: getProduct(),
    );
  }

  Widget getProduct() {
    return FutureBuilder(
      future: prodProvider.getProducto(1, 8),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final _productos = snapshot.data;
          return ListView.builder(
            itemCount: _productos.length,
            itemBuilder: (context, int index) {
              if (index + 1 >= _productos.length) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: _selectOption == index
                      ? Border.all(color: Colors.black26)
                      : null,
                ),
                child: ListTile(
                  title: Text(
                    _productos[index].nombre,
                    style: TextStyle(
                      color: _selectOption == index
                          ? Colors.black
                          : Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    _productos[index].descripcion +
                        ", Cantidad: " +
                        _productos[index].cantidad.toString(),
                    style: TextStyle(
                      color: _selectOption == index
                          ? Colors.black
                          : Colors.grey[600],
                    ),
                  ),
                  selected: _selectOption == index,
                  onTap: () {
                    setState(() {
                      _selectOption = index;
                    });
                  },
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

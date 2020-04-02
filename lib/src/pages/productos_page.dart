import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(),
            Divider(),
          ],
        ),
      ),
    );
  }
}

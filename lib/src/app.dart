import 'package:flutter/material.dart';

import 'package:practica2/src/pages/productos_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ProductoPage(),
      ),
    );
  }
}

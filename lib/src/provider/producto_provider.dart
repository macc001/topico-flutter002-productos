import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica2/src/models/producto.models.dart';

class ProductoProvider {
  Map<String, String> header = {"Content-Type": "application/json"};
  final String _url = "https://topicos-8bff9.firebaseio.com";

  Future<List<ProductoModel>> getProducto(int start, int cant) async {
    final String url = '$_url/productos.json';
    final resp2 = await http.get(url, headers: header);
    final List<ProductoModel> productos = new List();
    final Map<String, dynamic> decodedData = json.decode(resp2.body);
    if (decodedData == null) return [];
    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    return productos;
  }
}

import 'dart:convert';

import 'package:blisser/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchAllProducts() async {
  final response =
      await http.get(Uri.parse('http://localhost:8080/api/v1/products/'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse =
        jsonDecode(response.body) as List<dynamic>;
    return jsonResponse
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load products');
  }
}

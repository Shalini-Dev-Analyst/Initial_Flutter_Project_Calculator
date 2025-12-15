import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/product_model.dart';


class ProductRepository{
  final String baseUrl = 'https://api.restful-api.dev/objects';

  Future <List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200){
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json)=>Product.fromJson(json)).toList();
    }else{
      throw Exception('Failed to fetch product');
    }
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lingopanda/screens/product_model.dart';


class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<ProductModel> loadedProducts = (data['products'] as List)
            .map((productData) => ProductModel.fromJson(productData))
            .toList();
        _products = loadedProducts;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print(error);
      // Handle errors appropriately
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

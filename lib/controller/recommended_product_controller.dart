import 'dart:convert';

import 'package:food/data/product_api.dart';
import 'package:food/models/products.dart';
import 'package:http/http.dart' as http;

class RecommendProductController{
  List<ProductsModel> _recommendedProductList = [];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  Future<void> getRecommendProductList() async {
    http.Response response = await ProductApi().getRecommendedProductList();
    if(response.statusCode == 200){
      print('get recommended product');
      _recommendedProductList = [];
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      _recommendedProductList.addAll(Products.fromJson(jsonResponse).products);
    } else {
      print(response.body);
    }
  }

}
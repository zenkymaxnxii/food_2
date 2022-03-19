import 'dart:convert';

import 'package:food/data/product_api.dart';
import 'package:food/models/products.dart';
import 'package:http/http.dart' as http;

class PopularProductController{
  List<ProductsModel> _popularProductList = [];
  List<ProductsModel> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    http.Response response = await ProductApi().getPopularProductList();
    if(response.statusCode == 200){
      print('get popular product');
      _popularProductList = [];
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      _popularProductList.addAll(Products.fromJson(jsonResponse).products);
    } else {
      print(response.body);
    }
  }

}
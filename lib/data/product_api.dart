import 'package:http/http.dart' as http;
class ProductApi{
  static const String base_url = 'https://mvs.bslmeiyu.com';
  static const String popolar_product = '/api/v1/products/popular';
  static const String recommended_product = '/api/v1/products/recommended';


  Future<http.Response> getPopularProductList() async {
    Uri url = Uri.parse(base_url+popolar_product);
    return await http.get(url);
  }

  Future<http.Response> getRecommendedProductList() async {
    Uri url = Uri.parse(base_url+recommended_product);
    return await http.get(url);
  }
}
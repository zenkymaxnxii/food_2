class Carts {
  int? totalSize;
  late List<CartModel> productList;

  Carts({required this.totalSize,required this.productList});


  Carts.fromJson(Map<String, dynamic> json){
    totalSize = json['totalSize'];
    if(json['productList']!=null){
      productList = <CartModel>[];
      json['productList'].foreach((item){
        productList.add(CartModel.fromJson(item));
      });
    }
  }
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['totalSize'] = totalSize;
    data['productList'] = productList.map((e) => e.toJson()).toList();
    return data;
  }
}

class CartModel {
  int? id;
  int? idProduct;
  int? idUser;
  int? quality;

  CartModel(
      {required this.id,
        required this.idProduct,
        required this.idUser,
        required this.quality});
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduct = json['idProduct'];
    idUser = json['idUser'];
    quality = json['quality'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idProduct'] = idProduct;
    data['idUser'] = idUser;
    data['quality'] = quality;
    return data;
  }
}

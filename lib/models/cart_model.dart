/// id : 1
/// userId : 1
/// date : "2020-03-02T00:00:00.000Z"
/// products : [{"productId":1,"quantity":4},{"productId":2,"quantity":1},{"productId":3,"quantity":6}]
/// __v : 0

class CartModel {
  CartModel({
      num? id, 
      num? userId, 
      String? date, 
      List<Products>? products, 
      num? v,}){
    _id = id;
    _userId = userId;
    _date = date;
    _products = products;
    _v = v;
}

  CartModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _date = json['date'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _v = json['__v'];
  }
  num? _id;
  num? _userId;
  String? _date;
  List<Products>? _products;
  num? _v;
CartModel copyWith({  num? id,
  num? userId,
  String? date,
  List<Products>? products,
  num? v,
}) => CartModel(  id: id ?? _id,
  userId: userId ?? _userId,
  date: date ?? _date,
  products: products ?? _products,
  v: v ?? _v,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get date => _date;
  List<Products>? get products => _products;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['date'] = _date;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['__v'] = _v;
    return map;
  }

}

/// productId : 1
/// quantity : 4

class Products {
  Products({
      num? productId, 
      num? quantity,}){
    _productId = productId;
    _quantity = quantity;
}

  Products.fromJson(dynamic json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
  }
  num? _productId;
  num? _quantity;
Products copyWith({  num? productId,
  num? quantity,
}) => Products(  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
);
  num? get productId => _productId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}
import 'dart:core';

class ProductModel {
  String id;
  String name;
  String category;
  List<String> availableColors;
  int price;
  String? picturePath;

  ProductModel.withDefaults({
    required this.id,
    required this.name,
    required this.category,
    required this.availableColors,
    required this.price,
    this.picturePath =
        'https://down-th.img.susercontent.com/file/th-11134207-7r98z-ltl9tn858hu07f',
  });

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.availableColors,
    required this.price,
    this.picturePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      availableColors: json['availableColors'].cast<String>(),
      price: json['price'] as int,
      picturePath: json['picturePath'] as String?,
    );
  }
}

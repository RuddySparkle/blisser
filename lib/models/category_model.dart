import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
      name: 'Top',
      iconPath: '../assets/icons/category_top.svg',
      boxColor: const Color(0xff92a3fd),
    ));
    categories.add(CategoryModel(
      name: 'Pants',
      iconPath: '../assets/icons/category_pants.svg',
      boxColor: const Color(0xffc58bf2),
    ));
    return categories;
  }
}

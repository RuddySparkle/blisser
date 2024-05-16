class ClothModel {
  String name;
  String picturePath;
  String price;
  String category;
  List<String> availableColor;

  ClothModel({
    required this.name,
    required this.picturePath,
    required this.price,
    required this.category,
    required this.availableColor,
  });

  static List<ClothModel> getClothes() {
    List<ClothModel> clothes = [];

    clothes.add(ClothModel(
      name: 'Tank Top',
      picturePath:
          'https://down-th.img.susercontent.com/file/th-11134207-7r98z-ltl9tn858hu07f',
      price: '350',
      category: 'Top',
      availableColor: ['0xffffffff', '0xfffefbea', '0xffb1e5ff', '0xfff8c8dc'],
    ));

    return clothes;
  }
}

class ShopByCategoryModel {
  final String title;
  final String image;
  final String backgroundColorHex;

  ShopByCategoryModel({
    required this.title,
    required this.image,
    required this.backgroundColorHex,
  });

  factory ShopByCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShopByCategoryModel(
      title: json['title'],
      image: json['image'],
      backgroundColorHex: json['backgroundColorHex'],
    );
  }
}

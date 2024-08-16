class ShopByCategoryModel {
  final String title;
  final String image;

  ShopByCategoryModel({
    required this.title,
    required this.image,
  });

  factory ShopByCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShopByCategoryModel(
      title: json['title'],
      image: json['image'],
    );
  }
}

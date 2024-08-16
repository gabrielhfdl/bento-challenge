class TodaySpecialModel {
  final String title;
  final double rating;
  final String description;
  final String shop;
  final List<String> imagesUrl;
  final double price;
  final double oldPrice;

  TodaySpecialModel({
    required this.title,
    required this.rating,
    required this.description,
    required this.shop,
    required this.imagesUrl,
    required this.price,
    required this.oldPrice,
  });

  factory TodaySpecialModel.fromJson(Map<String, dynamic> json) {
    return TodaySpecialModel(
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
      shop: json['shop'],
      imagesUrl: List<String>.from(json['images']),
      price: json['price'],
      oldPrice: json['oldPrice'],
    );
  }
}

class TodaySpecialModel {
  final String title;
  final double rating;
  final String description;
  final String shop;
  final List<String> imagesUrl;

  TodaySpecialModel({
    required this.title,
    required this.rating,
    required this.description,
    required this.shop,
    required this.imagesUrl,
  });

  factory TodaySpecialModel.fromJson(Map<String, dynamic> json) {
    return TodaySpecialModel(
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
      shop: json['shop'],
      imagesUrl: List<String>.from(json['images']),
    );
  }
}

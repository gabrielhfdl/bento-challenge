import 'dart:ui';

import 'package:equatable/equatable.dart';

class SpecialTodayItem extends Equatable {
  final String itemName;
  final double rating;
  final String detailsText;
  final String shopName;
  final Color backgroundColor;

  const SpecialTodayItem({
    required this.itemName,
    required this.rating,
    required this.detailsText,
    required this.shopName,
    required this.backgroundColor,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

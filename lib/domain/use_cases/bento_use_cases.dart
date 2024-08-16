import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/data/model/today_special_model.dart';

abstract class BentoUseCases {
  Future<List<ShopByCategoryModel>> getListCategory();
  Future<List<TodaySpecialModel>> getTodaySpecial();
}

import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/data/model/today_special_model.dart';

abstract class BentoRepository {
  Future<List<ShopByCategoryModel>> getShopByCategoryData();
  Future<List<TodaySpecialModel>> getTodaySpecialData();
}

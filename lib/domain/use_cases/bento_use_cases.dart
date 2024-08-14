import 'package:bento_challenge/data/model/shop_by_category_model.dart';

abstract class BentoUseCases {
  Future<List<ShopByCategoryModel>> getListCategory();
}

import 'dart:convert';

import 'package:bento_challenge/data/data_source/bento_data_source.dart';
import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/data/repository/bento_repository.dart';

class BentoRepositoryImpl implements BentoRepository {
  final BentoDataSource _bentoDataSource;

  BentoRepositoryImpl(this._bentoDataSource);

  @override
  Future<List<ShopByCategoryModel>> getShopByCategoryData() async {
    final response = await _bentoDataSource.getShopByCategoryData();

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> categories = json['shopByCategory'] as List<dynamic>;

      final List<ShopByCategoryModel> shopByCategoryModelList = categories
          .map((json) =>
              ShopByCategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return shopByCategoryModelList;
    } else {
      //in real development, we should throw a custom exception
      throw Exception(
          'Error in BentoRepositoryImpl: statusCode: ${response.statusCode}  body: ${response.body}');
    }
  }
}

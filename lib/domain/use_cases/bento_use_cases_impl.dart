import 'package:bento_challenge/data/repository/bento_repository.dart';
import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/domain/use_cases/bento_use_cases.dart';

class BentoUseCasesImpl implements BentoUseCases {
  final BentoRepository _bentoRepository;

  BentoUseCasesImpl(this._bentoRepository);

  @override
  Future<List<ShopByCategoryModel>> getListCategory() async {
    try {
      final itens = await _bentoRepository.getShopByCategoryData();
      return itens;
    } catch (e) {
      throw Exception('Error in GetShopByCategoryUseCaseImpl: $e');
    }
  }
}

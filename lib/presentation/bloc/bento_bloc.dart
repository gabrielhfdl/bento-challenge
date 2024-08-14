import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/domain/use_cases/bento_use_cases.dart';
import 'package:rxdart/subjects.dart';

class BentoBloc {
  final BentoUseCases _bentoUseCases;
  final BehaviorSubject<List<ShopByCategoryModel>> _shopByCategorySubject =
      BehaviorSubject<List<ShopByCategoryModel>>();

  Stream<List<ShopByCategoryModel>> get shopByCategoryStream =>
      _shopByCategorySubject.stream;

  BentoBloc(this._bentoUseCases);

  void getShopByCategory() async {
    final shopByCategory = await _bentoUseCases.getListCategory();
    _shopByCategorySubject.add(shopByCategory);
  }

  void dispose() {
    _shopByCategorySubject.close();
  }
}

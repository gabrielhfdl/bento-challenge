import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/data/model/today_special_model.dart';
import 'package:bento_challenge/domain/use_cases/bento_use_cases.dart';
import 'package:rxdart/subjects.dart';

class BentoBloc {
  final BentoUseCases _bentoUseCases;

  final BehaviorSubject<List<ShopByCategoryModel>> _shopByCategorySubject =
      BehaviorSubject<List<ShopByCategoryModel>>();

  final BehaviorSubject<List<TodaySpecialModel>> _todaySpecialSubject =
      BehaviorSubject<List<TodaySpecialModel>>();

  Stream<List<ShopByCategoryModel>> get shopByCategoryStream =>
      _shopByCategorySubject.stream;

  Stream<List<TodaySpecialModel>> get todaySpecialStream =>
      _todaySpecialSubject.stream;

  BentoBloc(this._bentoUseCases);

  void getShopByCategory() async {
    try {
      final shopByCategory = await _bentoUseCases.getListCategory();
      _shopByCategorySubject.add(shopByCategory);
    } catch (e) {
      _shopByCategorySubject.addError(e);
    }
  }

  void getTodaySpecial() async {
    try {
      final todaySpecial = await _bentoUseCases.getTodaySpecial();
      _todaySpecialSubject.add(todaySpecial);
    } catch (e) {
      _todaySpecialSubject.addError(e);
    }
  }

  void dispose() {
    _shopByCategorySubject.close();
    _todaySpecialSubject.close();
  }
}

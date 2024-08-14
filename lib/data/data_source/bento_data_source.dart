import 'package:http/http.dart' as http;

abstract class BentoDataSource {
  Future<http.Response> getShopByCategoryData();
}

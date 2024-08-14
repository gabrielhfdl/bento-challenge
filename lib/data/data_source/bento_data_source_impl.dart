import 'package:bento_challenge/data/data_source/bento_data_source.dart';
import 'package:http/http.dart' as http;

class BentoDataSourceImpl implements BentoDataSource {
  @override
  Future<http.Response> getShopByCategoryData() async {
    String url = 'https://gabrielhfdl.github.io/host_api/shopbycategory.json';

    var response = await http.get(Uri.parse(url));
    return response;
  }
}

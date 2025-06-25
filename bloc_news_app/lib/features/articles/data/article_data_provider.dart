import 'package:http/http.dart';
import 'package:news_app/helpers/network_helper.dart';

class ArticleDataProvider {
  const ArticleDataProvider(this._networkHelper);

  final NetworkHelper _networkHelper;

  Future<Response?> getArticles() async {
    // const path = 'v2/everything?q=technology';
    // const apiKey = '36495f11982f4a0b9f794b150fd9fcf5';
    try {
      return _networkHelper.get(null, null);
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}

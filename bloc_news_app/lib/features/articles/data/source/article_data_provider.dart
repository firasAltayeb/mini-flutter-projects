import 'package:http/http.dart';
import 'package:news_app/env.dart';
import 'package:news_app/helpers/network_helper.dart';

class ArticleDataProvider {
  const ArticleDataProvider(this._networkHelper);

  final NetworkHelper _networkHelper;

  Future<Response?> getArticles() async {
    const apiKey = Env.key;
    try {
      return _networkHelper.get('v2/everything', apiKey);
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}

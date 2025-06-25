import "package:http/http.dart" as http;

class NetworkHelper {
  Future<http.Response> get(
    String? path,
    String? apiKey, {
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    Map<String, String> queryParams = {
      'apiKey': apiKey ?? '36495f11982f4a0b9f794b150fd9fcf5',
      'q': 'technology'
    };

    if (params != null) {
      queryParams.addAll(params);
    }

    Uri url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: path ?? 'v2/everything',
      queryParameters: queryParams,
    );

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}

import "package:http/http.dart" as http;

class NetworkHelper {
  Future<http.Response> get(
    String path,
    String apiKey, {
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    final queryParams = {'apiKey': apiKey, 'q': 'technology'};

    if (params != null) {
      queryParams.addAll(params);
    }

    final url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: path,
      queryParameters: queryParams,
    );

    try {
      return await http.get(url, headers: headers);
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}

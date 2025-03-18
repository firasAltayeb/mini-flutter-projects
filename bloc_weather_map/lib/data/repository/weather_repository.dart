import 'dart:convert';

import 'package:weather_app/model/general_weather_model.dart';

import '../data_provider/weather_data_provider.dart';

class WeatherRepositoryException implements Exception {
  final String message;
  final dynamic cause;

  WeatherRepositoryException(this.message, this.cause);

  @override
  String toString() =>
      'WeatherRepositoryException: $message${" Caused by: $cause"}';
}

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(this.weatherDataProvider);

  Future<GeneralWeatherModel> getCurrentWeather(String cityName) async {
    try {
      final response = await weatherDataProvider.getCurrentWeather(cityName);
      final Map<String, dynamic> data = jsonDecode(response);
      if (data['cod'].toString() != '200') {
        final msg = data['message'] ?? 'Unexpected error';
        throw WeatherRepositoryException('Error ${data['cod']}: $msg', data);
      }
      return GeneralWeatherModel.fromJson(data);
    } catch (e) {
      throw WeatherRepositoryException('Failed to fetch weather data', e);
    }
  }
}

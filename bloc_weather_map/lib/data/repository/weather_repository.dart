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
  const WeatherRepository(this.weatherDataProvider);

  final WeatherDataProvider weatherDataProvider;

  Future<GeneralWeatherModel> getCurrentWeather(String cityName) async {
    try {
      final response = await weatherDataProvider.getCurrentWeather(cityName);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return GeneralWeatherModel.fromJson(data);
      } else {
        throw WeatherRepositoryException("Error response", null);
      }
    } catch (e) {
      throw WeatherRepositoryException('Failed to fetch weather data', e);
    }
  }
}

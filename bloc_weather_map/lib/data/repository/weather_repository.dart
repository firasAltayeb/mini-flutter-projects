import 'dart:convert';

import 'package:weather_app/model/general_weather_model.dart';

import '../data_provider/weather_data_provider.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<GeneralWeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return GeneralWeatherModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

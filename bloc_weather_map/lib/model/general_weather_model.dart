import 'dart:convert';

import 'package:weather_app/model/city_weather_model.dart';
import 'package:weather_app/model/hourly_weather_model.dart';

class GeneralWeatherModel {
  final List<HourlyWeatherModel> hourlyForecast;
  final CityWeatherModel cityData;
  final String cod;

  GeneralWeatherModel({
    required this.hourlyForecast,
    required this.cityData,
    required this.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': hourlyForecast.map((x) => x.toMap()).toList(),
      'cityData': cityData.toJson(),
      'cod': cod,
    };
  }

  factory GeneralWeatherModel.fromMap(Map<String, dynamic> map) {
    final value = map['list'] as List<dynamic>;
    return GeneralWeatherModel(
      hourlyForecast: value.map((x) => HourlyWeatherModel.fromMap(x)).toList(),
      cityData: CityWeatherModel.fromJson(map['city']),
      cod: map['cod'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralWeatherModel.fromJson(source) =>
      GeneralWeatherModel.fromMap(source as Map<String, dynamic>);
}

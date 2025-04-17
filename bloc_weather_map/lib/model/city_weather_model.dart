import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_weather_model.freezed.dart';
part 'city_weather_model.g.dart';

@freezed
class CityWeatherModel with _$CityWeatherModel {
  const factory CityWeatherModel({
    required String name,
    required String country,
    required int population,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) = _CityWeatherModel;

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherModelFromJson(json);
}

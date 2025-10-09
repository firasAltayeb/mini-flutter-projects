import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/model/city_weather_model.dart';
import 'package:weather_app/model/hourly_weather_model.dart';

part 'general_weather_model.freezed.dart';
part 'general_weather_model.g.dart';

@freezed
class GeneralWeatherModel with _$GeneralWeatherModel {
  const factory GeneralWeatherModel({
    @JsonKey(name: 'list') required List<HourlyWeatherModel> hourlyForecast,
    @JsonKey(name: 'city') required CityWeatherModel cityData,
    required String cod,
  }) = _GeneralWeatherModel;

  factory GeneralWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralWeatherModelFromJson(json);
}

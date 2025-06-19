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

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'list': hourlyForecast.map((x) => x.toMap()).toList(),
  //     'cityData': cityData.toJson(),
  //     'cod': cod,
  //   };
  // }

  // factory GeneralWeatherModel.fromMap(Map<String, dynamic> map) {
  //   final value = map['list'] as List<dynamic>;
  //   return GeneralWeatherModel(
  //     hourlyForecast: value.map((x) => HourlyWeatherModel.fromMap(x)).toList(),
  //     cityData: CityWeatherModel.fromJson(map['city']),
  //     cod: map['cod'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory GeneralWeatherModel.fromJson(source) =>
  //     GeneralWeatherModel.fromMap(source as Map<String, dynamic>);
}

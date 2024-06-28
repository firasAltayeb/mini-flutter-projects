import 'dart:convert';

class CityWeatherModel {
  final String name;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityWeatherModel({
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory CityWeatherModel.fromMap(Map<String, dynamic> map) {
    return CityWeatherModel(
      name: map['name'] as String,
      country: map['country'] as String,
      population: map['population'] as int,
      timezone: map['timezone'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityWeatherModel.fromJson(String source) =>
      CityWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

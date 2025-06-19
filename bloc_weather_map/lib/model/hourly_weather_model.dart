import 'dart:convert';

class HourlyWeatherModel {
  final double currentTemp;
  final String currentSkyWeather;
  final String currentTime;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;

  HourlyWeatherModel({
    required this.currentTemp,
    required this.currentSkyWeather,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.currentTime,
  });

  HourlyWeatherModel copyWith({
    double? currentTemp,
    String? currentSkyWeather,
    String? currentTime,
    int? currentPressure,
    double? currentWindSpeed,
    int? currentHumidity,
  }) {
    return HourlyWeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSkyWeather: currentSkyWeather ?? this.currentSkyWeather,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentTime: currentTime ?? this.currentTime,
    );
  }

  String toJson() {
    return json.encode({
      'currentTemp': currentTemp,
      'currentSky': currentSkyWeather,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'dt_txt': currentTime,
    });
  }

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      currentTemp: json['main']['temp'],
      currentSkyWeather: json['weather'][0]['main'],
      currentPressure: json['main']['pressure'],
      currentWindSpeed: json['wind']['speed'],
      currentHumidity: json['main']['humidity'],
      currentTime: json['dt_txt'],
    );
  }
}

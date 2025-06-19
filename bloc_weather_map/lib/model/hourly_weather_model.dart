import 'dart:convert';

class HourlyWeatherModel {
  final double currentTemp;
  final String currentSkyWeather;
  final String currentTime;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  HourlyWeatherModel({
    required this.currentTemp,
    required this.currentSkyWeather,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.currentTime,
  });

  double get tempInCelsius =>
      double.parse((currentTemp - 273.15).toStringAsFixed(2));

  HourlyWeatherModel copyWith({
    double? currentTemp,
    String? currentSkyWeather,
    String? currentTime,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
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
      currentTemp: (json['main']['temp'] as num).toDouble(),
      currentSkyWeather: json['weather'][0]['main'],
      currentPressure: (json['main']['pressure'] as num).toDouble(),
      currentWindSpeed: (json['wind']['speed'] as num).toDouble(),
      currentHumidity: (json['main']['humidity'] as num).toDouble(),
      currentTime: json['dt_txt'],
    );
  }
}

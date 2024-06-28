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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSkyWeather,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'dt_txt': currentTime,
    };
  }

  factory HourlyWeatherModel.fromMap(Map<String, dynamic> currentWeatherData) {
    return HourlyWeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSkyWeather: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
      currentTime: currentWeatherData['dt_txt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyWeatherModel.fromJson(String source) =>
      HourlyWeatherModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static const String openWeatherAPIKey = _Env.openWeatherAPIKey;
}

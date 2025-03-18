part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class WeatherFetched extends WeatherEvent {
  final String city;

  WeatherFetched({this.city = "London"});
}

part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

final class WeatherFetched extends WeatherEvent {
  final String city;

  const WeatherFetched({this.city = "London"});

  @override
  List<Object> get props => [city];
}

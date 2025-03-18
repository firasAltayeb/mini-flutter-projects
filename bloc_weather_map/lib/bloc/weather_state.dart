part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherSuccess extends WeatherState {
  final GeneralWeatherModel weatherModel;

  const WeatherSuccess({required this.weatherModel});

  @override
  List<Object> get props => [weatherModel];
}

final class WeatherFailure extends WeatherState {
  final String error;

  const WeatherFailure({required this.error});

  @override
  List<Object> get props => [error];
}

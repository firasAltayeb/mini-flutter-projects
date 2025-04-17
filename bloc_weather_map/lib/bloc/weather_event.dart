import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.freezed.dart';

// part of 'weather_bloc.dart';

// @immutable
// sealed class WeatherEvent extends Equatable {
//   const WeatherEvent();

//   @override
//   List<Object?> get props => [];
// }

// final class WeatherFetched extends WeatherEvent {
//   final String city;

//   const WeatherFetched({this.city = "London"});

//   @override
//   List<Object> get props => [city];
// }

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.weatherFetched({@Default("London") String city}) =
      WeatherFetched;

  const factory WeatherEvent.loggedIn() = LoggedIn;
}

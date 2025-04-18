import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';

import '../data/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherState()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  Future<void> _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    // emit(WeatherLoading());
    emit(state.copyWith(loadState: LoadingStates.loading));
    try {
      final weather = await weatherRepository.getCurrentWeather(event.city);
      // emit(WeatherSuccess(weatherModel: weather));
      if (weather != null) {
        emit(state.copyWith(weatherModel: weather));
      }
    } catch (e) {
      // emit(WeatherFailure(error: e.toString()));
      emit(state.copyWith(loadState: LoadingStates.failure));
      rethrow;
    } finally {
      emit(state.copyWith(loadState: LoadingStates.success));
    }
  }
}

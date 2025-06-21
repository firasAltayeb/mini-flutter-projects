import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';

import '../data/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherState()) {
    on<WeatherFetched>(_getCurrentWeather);
    on<Initialize>(_onInitialize);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<WeatherState> emit,
  ) async {
    add(WeatherFetched(city: state.chosenCity));
  }

  Future<void> _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadingStates.loading));
    try {
      final weather = await weatherRepository.getCurrentWeather(event.city);
      if (weather != null) {
        emit(state.copyWith(chosenCity: event.city, weatherModel: weather));
      } else {
        await Fluttertoast.showToast(
          msg: "No data available for your search query. Please try again!",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      await Fluttertoast.showToast(
        msg: "Ops, something wrong happend. Please try again!",
        toastLength: Toast.LENGTH_SHORT,
      );
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loadState: LoadingStates.data));
    }
  }
}

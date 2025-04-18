import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc.dart';
import '../../bloc/weather_event.dart';
import '../../bloc/weather_state.dart';
import '../../data/repository/weather_repository.dart';
import '../widgets/additional_info_widget.dart';
import '../widgets/hourly_forecast_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(context.read<WeatherRepository>());
    _weatherBloc.add(WeatherFetched());
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _weatherBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _weatherBloc.add(WeatherFetched());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (_, state) {
            // if (state is WeatherFailure) {
            if (state.loadState == LoadingStates.failure ||
                state.weatherModel == null) {
              // return Center(child: Text(state.error));
              return Center(child: Text("error"));
            }
            // if (state is! WeatherSuccess) {
            if (state.loadState != LoadingStates.success) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            final hourlyForecast = state.weatherModel!.hourlyForecast;
            final skyWeather = hourlyForecast.first.currentSkyWeather;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  '${hourlyForecast.first.currentTemp} K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Icon(
                                  skyWeather == 'Clouds' || skyWeather == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  hourlyForecast.first.currentSkyWeather,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  HourlyForecastSection(
                    hourlyForecast: state.weatherModel!.hourlyForecast,
                  ),
                  AdditionalInformationSection(
                    weatherData: hourlyForecast.first,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

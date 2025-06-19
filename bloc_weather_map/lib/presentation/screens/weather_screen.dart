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
  final FocusNode _focusNode = FocusNode();
  String _chosenCity = "";
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(context.read<WeatherRepository>());
    _weatherBloc.add(Initialize());
    _focusNode.addListener(
      () => setState(() => _focused = _focusNode.hasFocus),
    );
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
                if (_chosenCity.isNotEmpty) {
                  _weatherBloc.add(WeatherFetched(city: _chosenCity));
                }
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (_, state) {
            // if (state is WeatherFailure) {
            if (state.loadState == LoadingStates.failure) {
              return Center(child: Text("error"));
            }
            // if (state is! WeatherSuccess) {
            if (state.loadState != LoadingStates.success) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            final hourlyForecast = state.weatherModel!.hourlyForecast;
            final skyWeather = hourlyForecast.first.currentSkyWeather;
            _chosenCity = state.chosenCity;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  SearchBar(
                    leading: const Icon(Icons.search, size: 30),
                    hintText:
                        _focused ? null : state.weatherModel?.cityData.name,
                    elevation: WidgetStatePropertyAll(4),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    focusNode: _focusNode,
                    onTapOutside: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                '${hourlyForecast.first.tempInCelsius} K',
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

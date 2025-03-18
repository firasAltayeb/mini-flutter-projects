import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/hourly_weather_model.dart';

class HourlyForecastSection extends StatelessWidget {
  final List<HourlyWeatherModel> hourlyForecast;

  const HourlyForecastSection({super.key, required this.hourlyForecast});

  IconData _weatherIcon(String sky) =>
      (sky == 'Clouds' || sky == 'Rain') ? Icons.cloud : Icons.sunny;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 8),
          child: Text(
            'Hourly Forecast',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final forecast = hourlyForecast[index + 1];
              final time = DateTime.parse(forecast.currentTime);
              return HourlyForecastItem(
                time: DateFormat.j().format(time),
                temperature: forecast.currentTemp.toString(),
                icon: _weatherIcon(forecast.currentSkyWeather),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}

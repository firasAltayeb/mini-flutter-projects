import 'package:flutter/material.dart';
import '../../model/hourly_weather_model.dart';

class AdditionalInformationSection extends StatelessWidget {
  final HourlyWeatherModel weatherData;

  const AdditionalInformationSection({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdditionalInfoItem(
              icon: Icons.water_drop,
              label: 'Humidity',
              value: weatherData.currentHumidity.toString(),
            ),
            AdditionalInfoItem(
              icon: Icons.air,
              label: 'Wind Speed',
              value: weatherData.currentWindSpeed.toString(),
            ),
            AdditionalInfoItem(
              icon: Icons.beach_access,
              label: 'Pressure',
              value: weatherData.currentPressure.toString(),
            ),
          ],
        ),
      ],
    );
  }
}

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        SizedBox(height: 8),
        Text(label),
        SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

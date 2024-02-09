import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon = Icons.wb_sunny; // Default to sunny
    return Column(
      children: [
        Icon(weatherIcon),
        Text(weather.date),
        Text(weather.dayOfWeek),
        Text('${weather.temperature}°C'),
        Text('Wind: ${weather.windSpeed} km/h'),
        Text('Pressure: ${weather.pressure} hPa'),
        Text('Humidity: ${weather.humidity}%'),
      ],
    );
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const apiKey = 'ykxc0aTSSAt3rNBapYXHo0YNBkILpalR';
  static const baseUrl = 'https://api.tomorrow.io/v4/timelines';

  final http.Client httpClient;

  WeatherApiClient(this.httpClient);

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    List<String> coordinates = location.split(',');
    String latitude = coordinates[0];
    String longitude = coordinates[1];

    final Uri weatherUrl = Uri.parse('$baseUrl?location=$latitude,$longitude'
        '&fields=temperature,windSpeed,humidity,pressureSurfaceLevel'
        '&units=metric'
        '&timesteps=1h'
        '&startTime=now'
        '&endTime=nowPlus1h'
        '&apikey=$apiKey');

    final response = await httpClient.get(weatherUrl);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

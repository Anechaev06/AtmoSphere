import '../models/weather_model.dart';
import '../services/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository(this.weatherApiClient);

  Future<WeatherModel> getWeather(String location) async {
    final weatherData = await weatherApiClient.fetchWeather(location);
    return WeatherModel.fromJson(weatherData['data']['timelines'][0]);
  }
}

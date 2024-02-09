double parseDouble(dynamic value, {double defaultValue = 0.0}) =>
    (value is num) ? value.toDouble() : defaultValue;
int parseInt(dynamic value, {int defaultValue = 0}) =>
    (value is num) ? value.toInt() : defaultValue;

class WeatherModel {
  final String date;
  final String dayOfWeek;
  final double temperature;
  final double windSpeed;
  final int pressure;
  final int humidity;
  final List<HourlyTemperature> hourlyTemperature;
  final List<DailyForecast> tenDaysForecast;

  WeatherModel({
    required this.date,
    required this.dayOfWeek,
    required this.temperature,
    required this.windSpeed,
    required this.pressure,
    required this.humidity,
    required this.hourlyTemperature,
    required this.tenDaysForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var data = json['data']['timelines'][0]['intervals'][0]['values'];
    return WeatherModel(
      date: json['startTime'] ?? '',
      dayOfWeek: json['endTime'] ??
          '', // Adjust this as per your logic to find the day of the week
      temperature: parseDouble(data['temperature']),
      windSpeed: parseDouble(data['windSpeed']),
      pressure: parseInt(data['pressureSurfaceLevel']),
      humidity: parseInt(data['humidity']),
      hourlyTemperature: [], // Populate this list as needed based on your app's design
      tenDaysForecast: [], // Populate this list as needed based on your app's design
    );
  }
}

class HourlyTemperature {
  final String time;
  final double temperature;

  HourlyTemperature({required this.time, required this.temperature});

  factory HourlyTemperature.fromJson(Map<String, dynamic> json) {
    return HourlyTemperature(
      time: json['startTime'],
      temperature: json['values']['temperature'].toDouble(),
    );
  }
}

class DailyForecast {
  final String date;
  final double dayTemperature;
  final double nightTemperature;

  DailyForecast(
      {required this.date,
      required this.dayTemperature,
      required this.nightTemperature});

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['startTime'],
      dayTemperature: json['values']['temperatureMax'].toDouble(),
      nightTemperature: json['values']['temperatureMin'].toDouble(),
    );
  }
}

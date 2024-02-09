import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../src/bloc/weather_bloc.dart';
import '../src/data/repositories/weather_repository.dart';
import '../src/data/services/weather_api_client.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // HTTP Client
  locator.registerLazySingleton<http.Client>(() => http.Client());

  // WeatherApiClient
  locator.registerLazySingleton<WeatherApiClient>(
    () => WeatherApiClient(locator<http.Client>()),
  );

  // WeatherRepository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepository(locator<WeatherApiClient>()),
  );

  // WeatherBloc
  locator.registerFactory(
    () => WeatherBloc(locator<WeatherRepository>()),
  );
}

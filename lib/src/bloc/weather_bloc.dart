import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/weather_model.dart';
import '../data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeather(event.location);
      emit(WeatherLoaded(weather));
    } catch (_) {
      emit(WeatherError("Failed to fetch weather data."));
    }
  }
}

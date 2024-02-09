import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/weather_bloc.dart';
import '../widgets/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You can also consider moving the FetchWeather event to a button press or initState if using StatefulWidget
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            context.read<WeatherBloc>().add(FetchWeather("New Yors"));
            return const Center(child: Text('Fetching weather...'));
          }
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return WeatherInfo(weather: state.weather);
          } else if (state is WeatherError) {
            return const Center(child: Text('Failed to fetch weather'));
          }
          return const SizedBox(); // Fallback empty widget
        },
      ),
    );
  }
}

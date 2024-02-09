import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_concept/src/bloc/weather_bloc.dart';
import 'core/core.dart';
import 'src/ui/screens/weather_screen.dart';

void main() {
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeatherApp",
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<WeatherBloc>(),
        child: const WeatherScreen(),
      ),
    );
  }
}

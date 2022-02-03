import 'package:flutter/material.dart';
import 'package:weather_test_app/screens/forecast/forecast.dart';
import 'package:weather_test_app/screens/settings/settings_screen.dart';
import 'package:weather_test_app/screens/today_weather/today_weather.dart';

Map<String, Widget Function(BuildContext)> AppRoutes = {
    '/': (context) => const Forecast(),
    '/forecast': (context) => const TodayWeather(),
    '/settings': (context) => const Settings(),
};
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const Map<String, IconData> weatherDecoration = {
    '01d': WeatherIcons.day_sunny,
    '02d': WeatherIcons.day_cloudy,
    '03d': WeatherIcons.cloud,
    '04d': WeatherIcons.cloudy,
    '09d': WeatherIcons.showers,
    '10d': WeatherIcons.day_rain,
    '11d': WeatherIcons.day_thunderstorm,
    '13d': WeatherIcons.day_snow,
    '50d': WeatherIcons.day_fog,
    '01n': WeatherIcons.night_clear,
    '02n': WeatherIcons.night_alt_cloudy,
    '03n': WeatherIcons.cloud,
    '04n': WeatherIcons.cloudy,
    '09n': WeatherIcons.showers,
    '10n': WeatherIcons.night_alt_rain,
    '11n': WeatherIcons.night_alt_thunderstorm,
    '13n': WeatherIcons.night_alt_snow,
    '50n': WeatherIcons.night_fog,
};

const Map<String, IconData> appIcons = {
    'wind': WeatherIcons.strong_wind,
    'degreesCelsius': WeatherIcons.celsius,
    'windDirection': WeatherIcons.wind_direction,
    'humidity': WeatherIcons.humidity,
};

const Map<String, IconData> navigationBarIcons = {
    'today': Icons.settings_suggest,
    'forecast': Icons.calendar_view_month,
    'settings': Icons.settings,
};
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const Map<String, BoxedIcon> weatherDecoration = {
    '01d': BoxedIcon(WeatherIcons.day_sunny),
    '02d': BoxedIcon(WeatherIcons.day_cloudy),
    '03d': BoxedIcon(WeatherIcons.cloud),
    '04d': BoxedIcon(WeatherIcons.cloudy),
    '09d': BoxedIcon(WeatherIcons.showers),
    '10d': BoxedIcon(WeatherIcons.day_rain),
    '11d': BoxedIcon(WeatherIcons.day_thunderstorm),
    '13d': BoxedIcon(WeatherIcons.day_snow),
    '50d': BoxedIcon(WeatherIcons.day_fog),
    '01n': BoxedIcon(WeatherIcons.night_clear),
    '02n': BoxedIcon(WeatherIcons.night_alt_cloudy),
    '03n': BoxedIcon(WeatherIcons.cloud),
    '04n': BoxedIcon(WeatherIcons.cloudy),
    '09n': BoxedIcon(WeatherIcons.showers),
    '10n': BoxedIcon(WeatherIcons.night_alt_rain),
    '11n': BoxedIcon(WeatherIcons.night_alt_thunderstorm),
    '13n': BoxedIcon(WeatherIcons.night_alt_snow),
    '50n': BoxedIcon(WeatherIcons.night_fog),
};

const Map<String, BoxedIcon> appIcons = {
    'wind': BoxedIcon(WeatherIcons.strong_wind),
    'degreesCelsius': BoxedIcon(WeatherIcons.celsius),
    'windDirection': BoxedIcon(WeatherIcons.wind_direction),
    'humidity': BoxedIcon(WeatherIcons.humidity),
};

const Map<String, IconData> navigationBarIcons = {
    'today': Icons.settings_suggest,
    'forecast': Icons.calendar_view_month,
    'settings': Icons.settings,
};

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
    final String apiKey;

    static const _openweathermapUrl = 'openweathermap.org';

    const WeatherRepository({
        required this.apiKey,
    });

    Future<Weather> getWeather(String city) async {
        final serverRequest = Uri.https(
            _openweathermapUrl, 
            '/data/2.5/forecast?q=Minsk&appid=$apiKey'
        );

        final serverResponse = await http.get(serverRequest);

        if (serverResponse.statusCode != 200) {
            throw ErrorDescription('Error');
        }

        final json = jsonDecode(serverResponse.body);

        final Weather weather = Weather.fromJson(json);

        return weather;
    }
}
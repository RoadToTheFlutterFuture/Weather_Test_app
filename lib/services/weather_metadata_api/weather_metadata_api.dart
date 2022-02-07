import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_test_app/services/weather_metadata_api/model/model.dart';

class WeatherMetadataApi {
    final String apiKey;

    static const _openweathermapUrl = 'api.openweathermap.org';

    const WeatherMetadataApi({
        required this.apiKey,
    });

    Future<CurrentWeather> getCurrentWeatherByCityName(String city) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/weather',
            {
                'q': city,
                'appid': apiKey,
                'units': 'metric'
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return CurrentWeather.fromJson(json);
    }

    Future<CurrentWeather> getCurrentWeatherByCoordinates(String lat, String lon) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/weather',
            {
                'lat': lat,
                'lon':  lon,
                'appid': apiKey,
                'units': 'metric',
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return CurrentWeather.fromJson(json);
    }

    Future<Weather> getWeatherByCityName(String city) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {
                'q': city,
                'appid': apiKey,
                'units': 'metric',
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return Weather.fromJson(json);
    }

    Future<Weather> getWeatherByCoordinates(String lat, String lon) async {
        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {
                'lat': lat,
                'lon':  lon,
                'appid': apiKey,
                'units': 'metric',
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return Weather.fromJson(json);
    }
}
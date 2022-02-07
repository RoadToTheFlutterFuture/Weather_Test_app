import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_test_app/services/weather_metadata_api/model/model.dart';

class WeatherMetadataApi {
    final String apiKey;

    static const _openweathermapUrl = 'api.openweathermap.org';

    const WeatherMetadataApi({
        required this.apiKey,
    });

    Future<CurrentWeather> getTodayWeather({required List<String> coord}) async {
        final url = coord.length == 1 ? _getUrlByCity(coord.first) : _getUrlByCoord(coord.first, coord.last);

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return CurrentWeather.fromJson(json);
    }

    Future<Weather> getFiveDayWeather({required List<String> coord}) async {
        final url = coord.length == 1 ? _getUrlByForecastCity(coord.first) : _getUrlByForecastCoord(coord.first, coord.last);

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        return Weather.fromJson(json);
    }

     _getUrlByForecastCity(String city) {
        return Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {
                'q': city,
                'appid': apiKey,
                'units': 'metric'
            }
        );
    }

    _getUrlByForecastCoord(String lat, String lon) {
        return Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {
                'lat': lat,
                'lon':  lon,
                'appid': apiKey,
                'units': 'metric',
            }
        );
    }

     _getUrlByCity(String city) {
        return Uri.https(
            _openweathermapUrl,
            '/data/2.5/weather',
            {
                'q': city,
                'appid': apiKey,
                'units': 'metric'
            }
        );
    }

    _getUrlByCoord(String lat, String lon) {
        return Uri.https(
            _openweathermapUrl,
            '/data/2.5/weather',
            {
                'lat': lat,
                'lon':  lon,
                'appid': apiKey,
                'units': 'metric',
            }
        );
    }
}
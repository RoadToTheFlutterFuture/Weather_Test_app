
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
    final String apiKey;
    final Map<List, String>? geographicalCoordinates;

    static const _openweathermapUrl = 'api.openweathermap.org';

    const WeatherRepository({
        required this.apiKey,
        this.geographicalCoordinates,
    });

    Future<Weather> getWeather(String city) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            geographicalCoordinates == null ?
            {
                'q': 'Minsk', 
                'appid': apiKey,
            } :
            {
                'lat': geographicalCoordinates!['lat'],
                'lon':  geographicalCoordinates!['lon'],
                'appid': apiKey,
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        final json = jsonDecode(serverResponse.body);

        final Weather weather = Weather.fromJson(json);

        return weather;
    }
}
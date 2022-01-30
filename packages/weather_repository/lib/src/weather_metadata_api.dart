
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_repository/weather_metadata_api.dart';

class WeatherMetadataApi {
    final String apiKey;

    static const _openweathermapUrl = 'api.openweathermap.org';

    const WeatherMetadataApi({
        required this.apiKey,
    });

    Future<Weather> getWeatherByCityName(String city) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {'q': city, 'appid': apiKey,}
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        return decodeJsonFromServer(serverResponse);
    }

    Future<Weather> getWeatherByCoordinates(String lat, String lon) async {

        final url = Uri.https(
            _openweathermapUrl,
            '/data/2.5/forecast',
            {
                'lat': lat,
                'lon':  lon,
                'appid': apiKey,
            }
        );

        final serverResponse = await http.get(url);
    
        if (serverResponse.statusCode != 200) {
            throw Error();
        }

        return decodeJsonFromServer(serverResponse);
    }

   Weather decodeJsonFromServer(serverResponse) {
        final json = jsonDecode(serverResponse.body);

        return Weather.fromJson(json);
    }
}
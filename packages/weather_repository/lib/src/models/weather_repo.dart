import 'package:weather_metadata_api/weather_metadata_api.dart';

class WeatherRepo {
    final CurrentWeather today;
    final Weather fewDays;

    const WeatherRepo({
        required this.today,
        required this.fewDays,
    });
}
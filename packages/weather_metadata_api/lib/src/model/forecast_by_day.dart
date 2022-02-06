
import 'package:weather_metadata_api/helpers/helpers.dart';

class ForecastByDay {
    final String date;
    final String time;
    final String description;
    final String parameter;
    final int humidity;
    final int cloudiness;
    final num temp;
    final int pressure;
    final int windDirection;
    final num windSpeed;

    ForecastByDay({
        required this.date,
        required this.time,
        required this.description,
        required this.parameter,
        required this.humidity,
        required this.cloudiness,
        required this.temp,
        required this.pressure,
        required this.windDirection,
        required this.windSpeed,
    });

    factory ForecastByDay.fromJson(Map<String, dynamic> json) {
        return ForecastByDay(
            date: json['dt_txt'] as String,
            time: getHours(utcDate: json['dt_txt'] as String),
            description: json['weather'][0]['description'] as String,
            parameter: json['weather'][0]['main'] as String,
            humidity: json['main']['humidity'] as int,
            cloudiness: json['clouds']['all'] as int,
            temp: json['main']['temp'] as num,
            pressure: json['main']['pressure'] as int,
            windDirection: json['wind']['deg'] as int,
            windSpeed: json['wind']['speed'] as num,
        );
    }
}

import 'package:weather_metadata_api/helpers/helpers.dart';

class ForecastByDay {
    final String date;
    final String time;
    final String description;
    final String parameter;
    final num humidity;
    final num cloudiness;
    final num temp;
    final num pressure;
    final num windDirection;
    final num windSpeed;
    final Map snowPrecipitations;
    final Map rainPrecipitations;

    ForecastByDay({
        required this.date,
        required this.time,
        required this.description,
        required this.parameter,
        required this.snowPrecipitations,
        required this.rainPrecipitations,
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
            snowPrecipitations: (json['snow'] ?? {}) as Map,
            rainPrecipitations: (json['rain'] ?? {}) as Map,
            humidity: json['main']['humidity'] as num,
            cloudiness: json['clouds']['all'] as num,
            temp: getIntegerNumber(number: json['main']['temp'] as num),
            pressure: json['main']['pressure'] as num,
            windDirection: json['wind']['deg'] as num,
            windSpeed: json['wind']['speed'] as num,
        );
    }
}
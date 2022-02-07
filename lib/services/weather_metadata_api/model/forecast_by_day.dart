


import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_test_app/services/weather_metadata_api/helpers/helpers.dart';

part 'forecast_by_day.g.dart';

@HiveType(typeId: 2)
class ForecastByDay {
    @HiveField(0)
    final String date;

    @HiveField(1)
    final String time;

    @HiveField(2)
    final String description;

    @HiveField(3)
    final String parameter;

    @HiveField(4)
    final num humidity;

    @HiveField(5)
    final num cloudiness;

    @HiveField(6)
    final num temp;

    @HiveField(7)
    final num pressure;

    @HiveField(8)
    final num windDirection;

    @HiveField(9)
    final num windSpeed;

    @HiveField(10)
    final Map snowPrecipitations;

    @HiveField(11)
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
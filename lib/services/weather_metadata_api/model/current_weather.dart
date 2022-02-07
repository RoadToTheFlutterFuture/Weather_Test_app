
import 'package:weather_test_app/services/weather_metadata_api/helpers/helpers.dart';

class CurrentWeather {
    final String city;
    final String countryCode;
    final String description;
    final String parameter;
    final String icon;
    final String windDirection;
    final String windSpeed;
    final num humidity;
    final num cloudiness;
    final num temp;
    final num pressure;

    CurrentWeather({
        required this.city,
        required this.countryCode,
        required this.description,
        required this.parameter,
        required this.icon,
        required this.windDirection,
        required this.humidity,
        required this.cloudiness,
        required this.temp,
        required this.pressure,
        required this.windSpeed,
    });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) {
        return CurrentWeather(
            city: json['name'] as String,
            countryCode: json['sys']['country'] as String,
            description: json['weather'][0]['description'] as String,
            parameter: json['weather'][0]['main'] as String,
            icon: json['weather'][0]['icon'] as String,
            humidity: json['main']['humidity'] as num,
            cloudiness: json['clouds']['all'] as num,
            temp: getIntegerNumber(number: json['main']['temp'] as num),
            pressure: json['main']['pressure'] as num,
            windDirection: getCompasDirection(deg: json['wind']['deg'] as num),
            windSpeed: getSpeedInKH(speed: json['wind']['speed'] as num),
        );
    }
}
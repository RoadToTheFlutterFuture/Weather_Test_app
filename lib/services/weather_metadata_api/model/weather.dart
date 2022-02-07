

import 'package:weather_test_app/services/weather_metadata_api/helpers/helpers.dart';

import 'city.dart';
import 'forecast_by_day.dart';

class Weather {
    final String cod;
    final int cnt;
    final City city;
    final Map<String, dynamic> forecastByDay;

    const Weather({
        required this.cod,
        required this.cnt,
        required this.city,
        required this.forecastByDay,
    });

    factory Weather.fromJson(Map<String, dynamic> json) {
        return Weather(
            cod: json['cod'] as String,
            cnt: json['cnt'] as int,
            city: City.fromJson(json['city']),
            forecastByDay: _getDailyWeather(json['list']),
        );
    }
}

Map<String, dynamic> _getDailyWeather(List<dynamic> threeHoursWeather){
    final Map<String, dynamic> dailyWeather = {};

    for(final item in threeHoursWeather) {
        final String utcDate = item['dt_txt'];
        final String key = getDayAbbr(utcDate: utcDate);
        final ForecastByDay result = ForecastByDay.fromJson(item as Map<String, dynamic>);

        if(!dailyWeather.containsKey(key)) {
            dailyWeather[key] = [];
            dailyWeather[key].add(result);
        } else {
            dailyWeather[key].add(result);
        }
    }

    return dailyWeather;
}

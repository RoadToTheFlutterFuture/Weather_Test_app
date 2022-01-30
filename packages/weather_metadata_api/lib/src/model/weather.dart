import 'city.dart';
import 'forecast_by_day.dart';

class Weather {
    final String cod;
    final int cnt;
    final City city;
    final List<ForecastByDay> forecastByDay;

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
            forecastByDay: (json['list'] as List<dynamic>).map(
                (dynamic item) => ForecastByDay.fromJson(item as Map<String, dynamic>)
            ).toList(),
        );
    }

}
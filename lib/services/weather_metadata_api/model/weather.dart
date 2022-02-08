

import 'package:weather_test_app/services/weather_metadata_api/helpers/helpers.dart';
import 'forecast_by_day.dart';

class Weather {
    final List<dynamic> forecastByDay;

    const Weather({
        required this.forecastByDay,
    });

    factory Weather.fromJson(Map<String, dynamic> json) {
        return Weather(
            forecastByDay: _getDailyWeather(json['list'] as List<dynamic>),
        );
    }
}

List<dynamic> _getDailyWeather(List<dynamic> threeHoursWeather){
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

    return  _convertToList(dailyWeather);
}

/*
* Convert Map<String, dynamic> to List<List<String, dyncami>>
*  - - - - 
* Example: input {'key', value} => output [ [key, value] ]
*/

List<dynamic> _convertToList(Map<String, dynamic> data) {
    final List convertedData = [];

    for (var element in data.entries) {
          convertedData.add([element.key, element.value]);
    }

    return convertedData;
}

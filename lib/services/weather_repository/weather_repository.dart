


import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/services/hive_cash/hive_cash.dart';
import 'package:weather_test_app/services/weather_metadata_api/model/model.dart';
import 'package:weather_test_app/services/weather_metadata_api/weather_metadata_api.dart';

class WeatherRepository {
    static const _weatherMetadataApi = WeatherMetadataApi(
        apiKey: 'a439badca9f3596ee98b0eb090cba0f9'
    );
    static final hiveCash = HiveCashService();

    Future getWeater({required List<String> coord}) async {
        print(coord);
        try{ 
            final CurrentWeather currentWeather =  await _weatherMetadataApi.getTodayWeather(coord: coord);
            final Weather weather = await _weatherMetadataApi.getFiveDayWeather(coord: coord);

            hiveCash.putWeatherIntoBox(
                todayData: TodayWeather(
                    bigIcon: currentWeather.icon,
                    cityTitle: '${currentWeather.city}, ${currentWeather.countryCode}',
                    tempTitle: '${currentWeather.temp}℃ | ${currentWeather.parameter}',
                    humidity: '${currentWeather.humidity}%',
                    precipitations: _getCurrentPrecipitations(weather),
                    pressure: '${currentWeather.pressure} hPa',
                    windSpeed: '${currentWeather.windSpeed} km/h',
                    windDirection: currentWeather.windDirection,
                ), 
                fiveDayData: FiveDayWeather(fiveDay: weather.forecastByDay)
            );
        }
        catch (e) {
            var todayWeather;
            var fiveDayWeather;

            try {
                todayWeather = await getTodayWeather();
                fiveDayWeather = await getFiveDayWeather();
            }catch(e) {
                print('___!!!!!!!__$e ____!!!!!!!___');
                todayWeather = TodayWeather(
                    bigIcon: '',
                    cityTitle: '',
                    tempTitle: '',
                    humidity: '',
                    precipitations: '',
                    pressure: '',
                    windSpeed: '',
                    windDirection: '',
                );
                fiveDayWeather = FiveDayWeather(fiveDay: []);
            }finally{
                hiveCash.putWeatherIntoBox(
                    todayData: todayWeather,
                    fiveDayData: fiveDayWeather
                );
            }

        }
           
    }

     Future getTodayWeather() async {
        final BoxWeather weather = await hiveCash.getWeatherFromBox();

        print(weather);

        return weather.today;
    }

     Future<FiveDayWeather> getFiveDayWeather() async {
        final BoxWeather weather = await hiveCash.getWeatherFromBox();

        return weather.fiveDay;
    }

/*
* weather.forecastByDay[0][1][0] => ForecastByDay
*/

    String _getCurrentPrecipitations(Weather weather) {
        final snowRecipitations = weather.forecastByDay[0][1][0].snowPrecipitations;
        final rainRecipitations = weather.forecastByDay[0][1][0].rainPrecipitations;

        if(snowRecipitations.isEmpty && rainRecipitations.isEmpty) {
            return '0';
        }

        return '${snowRecipitations?['3h'] ?? rainRecipitations?['3h']} mm';
    }
}
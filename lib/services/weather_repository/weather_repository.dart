


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
            print('getWeatherERROR _______ $e');
              hiveCash.putWeatherIntoBox(
                todayData: TodayWeather(
                    bigIcon: '50n',
                    cityTitle: 'City',
                    tempTitle: 'Temp',
                    humidity: '- %',
                    precipitations: '-',
                    pressure: '- hPa',
                    windSpeed: '- km/h',
                    windDirection: '-',
                ), 
                fiveDayData: FiveDayWeather(fiveDay: {})
            );
        }
    }

     Future getTodayWeather() async {
        final BoxWeather weather = await hiveCash.getWeatherFromBox();

        return weather.today;
    }

     Future<FiveDayWeather> getFiveDayWeather() async {
        final BoxWeather weather = await hiveCash.getWeatherFromBox();

        return weather.fiveDay;
    }

    String _getCurrentPrecipitations(Weather weather) {
        final snowRecipitations = weather.forecastByDay['Today'][0].snowPrecipitations;
        final rainRecipitations = weather.forecastByDay['Today'][0].rainPrecipitations;

        if(snowRecipitations.isEmpty && rainRecipitations.isEmpty) {
            return '0';
        }

        return '${snowRecipitations?['3h'] ?? rainRecipitations?['3h']} mm';
    }
}
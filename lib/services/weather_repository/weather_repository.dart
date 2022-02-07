


import 'package:weather_test_app/services/weather_metadata_api/model/model.dart';
import 'package:weather_test_app/services/weather_metadata_api/weather_metadata_api.dart';

class WeatherRepository {
    static const _weatherMetadataApi = WeatherMetadataApi(
        apiKey: 'a439badca9f3596ee98b0eb090cba0f9'
    );

    Future getWeater({List<String>? coord}) async {
        try {
            final Weather weather = coord!.length == 0 ?
                await _weatherMetadataApi.getWeatherByCityName(coord.first) :
                await _weatherMetadataApi.getWeatherByCoordinates(coord.first, coord.last);

            final CurrentWeather currentWeather = coord.length == 0 ?
                await _weatherMetadataApi.getCurrentWeatherByCityName(coord.first) :
                await _weatherMetadataApi.getCurrentWeatherByCoordinates(coord.first, coord.last);

        }
        catch (error) {

        }
      

        // return WeatherRepo(
        //     today: currentWeather,
        //     fewDays: weather,
        // );
    }
}
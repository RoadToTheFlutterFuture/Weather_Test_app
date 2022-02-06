
import 'package:weather_metadata_api/weather_metadata_api.dart';
import 'package:weather_repository/weather_repository.dart';


class WeatherRepository {
    static const _weatherMetadataApi = WeatherMetadataApi(
        apiKey: 'a439badca9f3596ee98b0eb090cba0f9'
    );

    Future<WeatherRepo> getWeater({List<String>? coord}) async {

        final Weather weather = coord!.length == 0 ? 
            await _weatherMetadataApi.getWeatherByCityName(coord.first) :
            await _weatherMetadataApi.getWeatherByCoordinates(coord.first, coord.last);

        final CurrentWeather currentWeather = coord.length == 0 ? 
            await _weatherMetadataApi.getCurrentWeatherByCityName(coord.first) :
            await _weatherMetadataApi.getCurrentWeatherByCoordinates(coord.first, coord.last);

        return WeatherRepo(
            today: currentWeather,
            fewDays: weather,
        );
    }
}
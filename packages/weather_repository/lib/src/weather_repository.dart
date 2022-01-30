
import 'package:weather_metadata_api/weather_metadata_api.dart';
import 'package:weather_repository/weather_repository.dart';


class WeatherRepository {
    static const _weatherMetadataApi = WeatherMetadataApi(
        apiKey: 'a439badca9f3596ee98b0eb090cba0f9'
    );

    Future<WeatherRepo> getWeater({String? city, Coordinates? cord}) async {

        final Weather weather = city != null ? 
            await _weatherMetadataApi.getWeatherByCityName(city) :
            await _weatherMetadataApi.getWeatherByCoordinates(cord!.latitude, cord.longitude);

        final CurrentWeather currentWeather = city != null ? 
            await _weatherMetadataApi.getCurrentWeatherByCityName(city) :
            await _weatherMetadataApi.getCurrentWeatherByCoordinates(cord!.latitude, cord.longitude);

        return WeatherRepo(
            today: currentWeather,
            fewDays: weather,
        );
    }
}
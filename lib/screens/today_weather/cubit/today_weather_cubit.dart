import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

part 'today_weather_state.dart';

class TodayWeatherCubit extends Cubit<TodayWeatherState> {
    final WeatherRepository weatherRepository;

    TodayWeatherCubit(this.weatherRepository) : super(
        TodayWeatherState( status: TodayWeatherStatus.initial )
    );

    fetchWeather() async {
        final TodayWeather weather = await weatherRepository.getTodayWeather();

        emit(state.copyWith(
            repository: weather,
            status: TodayWeatherStatus.loaded
        ));
    }

    void shareWeatherText() async {
        final String cityText = 'City: ${state.repository!.cityTitle}';
        final String cityTemperature = 'Temperature: ${state.repository!.tempTitle}';
        final String windSpeed = 'Wind speed: ${state.repository!.windSpeed}';
        final String windDirection = 'Wind direction: ${state.repository!.windDirection}';
        final String precipitations = 'Precipitations amount: ${state.repository!.precipitations}';
        final String weatherText = '$cityText; \n $cityTemperature; \n $windSpeed; \n $windDirection; \n $precipitations;';

        await Share.share(weatherText, subject: 'Weather in my city ⛅');
    }
}
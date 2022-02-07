import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_test_app/helpers/helpers.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

part 'today_weather_state.dart';

class TodayWeatherCubit extends Cubit<TodayWeatherState> {
    final WeatherRepository weatherRepository;

    TodayWeatherCubit(this.weatherRepository) : super(TodayWeatherState(
        status: TodayWeatherStatus.gettingWeather,
    ));

    fetchWeather() async {
        await _getCurrentPosition();

        // final WeatherRepo dataFromRepo = await weatherRepository.getWeater(coord: state.userLocation ?? ['Minsk']);

        emit(state.copyWith(
            // repository: TodayWeather(
            //     bigIcon: dataFromRepo.today.icon,
            //     cityTitle: '${dataFromRepo.today.city}, ${dataFromRepo.today.countryCode}',
            //     tempTitle: '${dataFromRepo.today.temp}℃ | ${dataFromRepo.today.parameter}',
            //     humidity: '${dataFromRepo.today.humidity}%',
            //     precipitations: _getCurrentPrecipitations(dataFromRepo),
            //     pressure: '${dataFromRepo.today.pressure} hPa',
            //     windSpeed: '${dataFromRepo.today.windSpeed} km/h',
            //     windDirection: dataFromRepo.today.windDirection,
            // ),
            status: TodayWeatherStatus.loaded,
        ));
    }

    // String _getCurrentPrecipitations(WeatherRepo repo) {
    //     final snowRecipitations = repo.fewDays.forecastByDay['Today'][0].snowPrecipitations;
    //     final rainRecipitations = repo.fewDays.forecastByDay['Today'][0].rainPrecipitations;

    //     if(snowRecipitations.isEmpty && rainRecipitations.isEmpty) {
    //         return '0';
    //     }

    //     return '${snowRecipitations?['3h'] ?? rainRecipitations?['3h']} mm';
    // }

    _getCurrentPosition() async {
        try {
           await determinePosition()
           .then((position) {
               emit(state.copyWith(
                   userLocation: [position.latitude.toString(), position.longitude.toString()], 
                ));
           });

        } catch (error) {
            emit(state.copyWith(
                userLocation: ['Minsk']
            ));
        }
    }

    void shareWeatherText() async {
        // final String cityText = 'City: ${state.repository!.cityTitle}';
        // final String cityTemperature = 'Temperature: ${state.repository!.tempTitle}';
        // final String windSpeed = 'Wind speed: ${state.repository!.windSpeed}';
        // final String windDirection = 'Wind direction: ${state.repository!.windDirection}';
        // final String precipitations = 'Precipitations amount: ${state.repository!.precipitations}';
        // final String weatherText = '$cityText; \n $cityTemperature; \n $windSpeed; \n $windDirection; \n $precipitations;';

        await Share.share('hello', subject: 'Weather in my city ⛅');
    }
}
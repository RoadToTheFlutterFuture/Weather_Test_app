import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart';

part 'today_weather_state.dart';

class TodayWeatherCubit extends Cubit<TodayWeatherState> {
    final WeatherRepository weatherRepository;

    TodayWeatherCubit(this.weatherRepository) : super(TodayWeatherState(
        status: TodayWeatherStatus.gettingWeather,
    ));

    fetchWeather() async {
        emit(state.copyWith(status: TodayWeatherStatus.uploading));
        
        final todayWEather = await weatherRepository.getWeater(city: 'Minsk');

        emit(state.copyWith(
            repository: todayWEather,
            status: TodayWeatherStatus.loaded,
        ));
    }
}

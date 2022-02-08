import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_test_app/helpers/helpers.dart';
import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
    final WeatherRepository weatherRepository;

    ForecastCubit(this.weatherRepository) : super(ForecastState(
       status: ForecastStateStatus.initial,
    ));

     fetchWeather() async {
        final FiveDayWeather fiveDayWeather = await weatherRepository.getFiveDayWeather();

        emit(state.copyWith(
            repository: fiveDayWeather,
            status: ForecastStateStatus.loaded
        ));
    }

    updateWeather() async {
        try {
            final coordinates = await determinePosition();
         
            await WeatherRepository().getWeater(
                coord: [coordinates.latitude.toString() ,coordinates.longitude.toString()]
            );
        } catch(error){
            print('Error In FetchWeather ________ $error');
            WeatherRepository().getWeater(coord: ['Minsk']);
        }
        finally {
            final FiveDayWeather fiveDayWeather = await weatherRepository.getFiveDayWeather();
            emit(state.copyWith(
                repository: fiveDayWeather,
                status: ForecastStateStatus.loaded
            ));
        }
    }
}

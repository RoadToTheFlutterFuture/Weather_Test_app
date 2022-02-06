part of 'today_weather_cubit.dart';

enum TodayWeatherStatus {
    initial,
    gettingWeather,
    uploading,
    loaded,
}

class TodayWeatherState extends Equatable {
    final WeatherRepo? repository;
    final TodayWeatherStatus status;

    const TodayWeatherState({
        this.repository,
        required this.status,
    });

    @override
    List<Object> get props => [status];

    TodayWeatherState copyWith({
        WeatherRepo? repository,
        TodayWeatherStatus? status,
    }) {
        return TodayWeatherState(
            repository: repository ?? this.repository,
            status: status ?? this.status
        );
    }
}

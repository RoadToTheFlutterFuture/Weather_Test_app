part of 'today_weather_cubit.dart';

enum TodayWeatherStatus {
    initial,
    gettingWeather,
    uploading,
    loaded,
}

class TodayWeatherState extends Equatable {
    final Map? repository;
    final TodayWeatherStatus status;
    final List<String>? userLocation;

    const TodayWeatherState({
        this.repository,
        this.userLocation,
        required this.status,
    });

    @override
    List<Object> get props => [status];

    TodayWeatherState copyWith({
        Map? repository,
        TodayWeatherStatus? status,
        List<String>? userLocation,
    }) {
        return TodayWeatherState(
            repository: repository ?? this.repository,
            status: status ?? this.status,
            userLocation: userLocation ?? this.userLocation,
        );
    }
}

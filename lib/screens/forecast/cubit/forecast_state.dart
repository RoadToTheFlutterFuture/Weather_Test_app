part of 'forecast_cubit.dart';


enum ForecastStateStatus {
    initial,
    gettingWeather,
    uploading,
    loaded,
}

class ForecastState extends Equatable {
    final FiveDayWeather? repository;
    final ForecastStateStatus status;

    const ForecastState({
        this.repository,
        required this.status,
    });

    @override
    List<Object> get props => [status];

    ForecastState copyWith({
        FiveDayWeather? repository,
        ForecastStateStatus? status,
        List<String>? userLocation,
    }) {
        return ForecastState(
            repository: repository ?? this.repository,
            status: status ?? this.status,
        );
    }
}


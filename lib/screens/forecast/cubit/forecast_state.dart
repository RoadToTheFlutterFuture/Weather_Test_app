// part of 'forecast_cubit.dart';


// enum ForecastStateStatus {
//     initial,
//     gettingWeather,
//     uploading,
//     loaded,
// }

// class ForecastState extends Equatable {
//     final Map? repository;
//     final ForecastStateStatus status;
//     final List<String>? userLocation;

//     const ForecastState({
//         this.repository,
//         this.userLocation,
//         required this.status,
//     });

//     @override
//     List<Object> get props => [status];

//     ForecastState copyWith({
//         Map? repository,
//         ForecastStateStatus? status,
//         List<String>? userLocation,
//     }) {
//         return ForecastState(
//             repository: repository ?? this.repository,
//             status: status ?? this.status,
//             userLocation: userLocation ?? this.userLocation,
//         );
//     }
// }


import 'package:weather_test_app/services/data_models/data_models.dart';

class BoxWeather {
    final TodayWeather today;
    final FiveDayWeather fiveDay;

    const BoxWeather({
        required this.today,
        required this.fiveDay,
    });
}
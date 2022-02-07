
import 'package:hive/hive.dart';

part 'fewDays_weather.g.dart';

@HiveType(typeId: 1)
class FewDaysWeather {
    @HiveField(0)
    final Map<String, dynamic> forecastByDay;

    const FewDaysWeather ({
      required this.forecastByDay,
    });
}
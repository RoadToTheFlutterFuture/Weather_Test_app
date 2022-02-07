import 'package:hive/hive.dart';

part 'today_weather.g.dart';

@HiveType(typeId: 0)
class TodayWeather {
    @HiveField(0, defaultValue: '50n')
    final String bigIcon;

    @HiveField(1, defaultValue: 'City')
    final String cityTitle;

    @HiveField(2, defaultValue: 'Temp')
    final String tempTitle;

    @HiveField(3, defaultValue: 'humidity')
    final String humidity;

    @HiveField(4, defaultValue: 'precipi')
    final String precipitations;

    @HiveField(5, defaultValue: 'pressure')
    final String pressure;

    @HiveField(6, defaultValue: 'windSpeed')
    final String windSpeed;

    @HiveField(7, defaultValue: 'windDirection')
    final String windDirection;

    const TodayWeather ({
      required this.bigIcon,
      required this.cityTitle,
      required this.tempTitle,
      required this.humidity,
      required this.precipitations,
      required this.pressure,
      required this.windSpeed,
      required this.windDirection,
    });
}
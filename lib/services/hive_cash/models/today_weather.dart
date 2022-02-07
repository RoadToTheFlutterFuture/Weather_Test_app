import 'package:hive/hive.dart';

part 'today_weather.g.dart';

@HiveType(typeId: 0)
class TodayWeather {
    @HiveField(0)
    final String bigIcon;

    @HiveField(1)
    final String cityTitle;

     @HiveField(2)
    final String tempTitle;

    @HiveField(3)
    final String humidity;

    @HiveField(4)
    final String precipitations;

    @HiveField(5)
    final String pressure;

    @HiveField(6)
    final String windSpeed;

    @HiveField(7)
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
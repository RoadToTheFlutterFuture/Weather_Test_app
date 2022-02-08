
import 'package:hive/hive.dart';

part 'fiveday_weather.g.dart';

@HiveType(typeId: 5)
class FiveDayWeather {
    @HiveField(0, defaultValue: [])
    final List<dynamic>? fiveDay;

    const FiveDayWeather ({
         this.fiveDay,
    });
}
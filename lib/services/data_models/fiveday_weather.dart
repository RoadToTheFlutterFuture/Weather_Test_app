
import 'package:hive/hive.dart';


part 'fiveday_weather.g.dart';

@HiveType(typeId: 1)
class FiveDayWeather {
    @HiveField(0)
    final Map<String, dynamic> fiveDay;

    const FiveDayWeather ({
        required this.fiveDay,
    });
}
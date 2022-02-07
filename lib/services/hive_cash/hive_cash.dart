import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/services/weather_metadata_api/model/forecast_by_day.dart';
class HiveCashService {
    static Future<void> init() async {
        final appDocumentDir = await getApplicationDocumentsDirectory();

        Hive.init(appDocumentDir.path);

        if(!Hive.isAdapterRegistered(0) && 
           !Hive.isAdapterRegistered(1) && 
           !Hive.isAdapterRegistered(2) 
          ){
            Hive.registerAdapter(TodayWeatherAdapter());
            Hive.registerAdapter(FiveDayWeatherAdapter());
            Hive.registerAdapter(ForecastByDayAdapter());
        }
    }

    void putWeatherIntoBox({
        required TodayWeather todayData, 
        required FiveDayWeather fiveDayData
    }) async {
        final toDaybox = await Hive.openBox<TodayWeather>("today");
        await toDaybox.put("weather", todayData);

        final fiveDayBox = await Hive.openBox<FiveDayWeather>("fiveDay");
        await fiveDayBox.put("weather", fiveDayData);

        toDaybox.close();
        fiveDayBox.close();
    }

    Future getWeatherFromBox() async {
        final toDaybox = await Hive.openBox<TodayWeather>("today");
        final TodayWeather? todayWeather = await toDaybox.get('weather');
        print(todayWeather);

        final fiveDayBox = await Hive.openBox<FiveDayWeather>("fiveDay");
        final FiveDayWeather? fiveDayWeather = await fiveDayBox.get('weather');

        final BoxWeather result = BoxWeather(
            today: todayWeather!,
            fiveDay: fiveDayWeather!,
        );

        toDaybox.close();
        fiveDayBox.close();

        return result;
    }
}
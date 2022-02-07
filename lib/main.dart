import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_test_app/helpers/helpers.dart';
import 'package:weather_test_app/services/hive_cash/hive_cash.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

import 'app.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    await HiveCashService.init();

    try {
        await determinePosition().then((p) => {
                WeatherRepository().getWeater(
                    coord: [p.latitude.toString() ,p.longitude.toString()]
                )
            });
     } catch(error){
         print(error);
          WeatherRepository().getWeater(coord: ['Minsk']);
     }

    runApp(
        EasyLocalization(
            child: App(
                weatherRepository: WeatherRepository(),
            ),
            supportedLocales: [
                Locale('ru'),
                Locale('en'), 
            ],
            path: 'assets/translations',
            fallbackLocale: Locale('en'), 
        )
    );
}
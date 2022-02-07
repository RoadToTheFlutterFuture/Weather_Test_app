import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

import 'app.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

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
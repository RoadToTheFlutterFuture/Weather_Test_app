import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/screens/weatherApp.dart';

import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';
import 'services/weather_repository/weather_repository.dart';

class App extends StatelessWidget {
    final WeatherRepository weatherRepository;

    App({
        Key? key,
       required this.weatherRepository,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return RepositoryProvider.value(
            value: weatherRepository,
            child: _WeatherMaterialApp()
        );
    }
}

class _WeatherMaterialApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return AdaptiveTheme(
            light: lightTheme,
            dark: darkTheme,
            initial: AdaptiveThemeMode.light,
            builder: (light, dark) => MaterialApp (
                theme: light,
                darkTheme: dark,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: MainWeatherScreen(),
            ),
        );
    }
}
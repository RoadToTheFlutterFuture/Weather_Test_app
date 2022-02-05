import 'package:flutter/material.dart';
import 'package:weather_test_app/screens/forecast/views/dailyWeather_silverList.dart';
import 'package:weather_test_app/screens/forecast/views/weatherDate_silverAppBar.dart';
import 'package:weather_test_app/widgets/weather_bottomNavigationBar/weather_bottomNavigationBar.dart';

class Forecast extends StatelessWidget {
    const Forecast({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('City'), //TODO: translate it | Today
            ),
            bottomNavigationBar: WeatherBottomNavigationBar(),
            body: RefreshIndicator(
                onRefresh: () => Future.delayed(Duration(seconds: 2), () => {}),
                child: CustomScrollView(
                    slivers: _getSilvers()
                ),
            ),
        );
    }

    List<Widget> _getSilvers(){
        return [
                WeatherDateSilverAppBar(status: true, title: 'First'),
                DailyWeatherSilverList(),
                WeatherDateSilverAppBar(title: 'Second'),
                DailyWeatherSilverList(),
        ];
    }
}
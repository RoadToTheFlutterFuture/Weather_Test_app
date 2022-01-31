import 'package:flutter/material.dart';
import 'package:weather_test_app/widgets/weather_bottomNavigationBar/weather_bottomNavigationBar.dart';

class TodayWeather extends StatelessWidget {
    const TodayWeather({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Today'), //Todo: translate it | Today
            ),
            bottomNavigationBar: WeatherBottomNavigationBar(),
            body: Column(
                children: [
                    Flexible(
                        flex: 3,
                        child: Container(color: Colors.green,)
                    ),
                    Flexible(
                        flex: 2,
                        child: Container(color: Colors.red,)
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(color: Colors.blue,)
                    ),
                ],
            ),
        );
    }
}
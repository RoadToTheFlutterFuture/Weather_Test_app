import 'package:flutter/material.dart';
import 'package:weather_test_app/constants/icons/icons.dart';
import 'package:weather_test_app/screens/today_weather/views/bigIcon_weather/bigIcon_weather.dart';
import 'package:weather_test_app/screens/today_weather/views/parameters_weather/parameters_weather.dart';
import 'package:weather_test_app/widgets/decoretion_line.dart';
import 'package:weather_test_app/widgets/weather_bottomNavigationBar/weather_bottomNavigationBar.dart';

class TodayWeather extends StatelessWidget {
    const TodayWeather({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Today'), //TODO: translate it | Today
            ),
            bottomNavigationBar: WeatherBottomNavigationBar(),
            body: Stack(
              children:[
                Column(
                  children: [
                      Flexible(
                          flex: 3,
                          child: BigIconWeather(
                              cityTitle: 'London, Uk', 
                              tempTitle: '22 C | Sunny',
                              bigIcon: weatherDecoration['01d'],
                          ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Stack(
                              alignment: Alignment.center,
                              children: [
                                  DecorationLine(bottom: 0,),
                                  ParametersWeather(),
                                  DecorationLine(top: 0,)
                              ],
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child: Center(
                              child: TextButton(
                                  onPressed: (){print('Send');},
                                  child: Text('Share'), //TODO: translate it | Share
                              ),
                          )
                      ),
                  ],
              ),
              Container(color: Colors.transparent),
              ]
            ),
        );
    }
}
import 'package:flutter/material.dart';
import 'package:weather_test_app/constants/icons/icons.dart';
import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/widgets/icon_with_bottomTitle.dart';

class ParametersWeather extends StatelessWidget {
    final TodayWeather? parameters; 

    const ParametersWeather({
        this.parameters,
        Key? key
        }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconWithBottomTitle(icon: appIcons['humidity'] as IconData, title: parameters!.humidity,),
                            IconWithBottomTitle(icon: appIcons['other'] as IconData, title: parameters!.precipitations,),
                            IconWithBottomTitle(icon: appIcons['pressure'] as IconData, title: parameters!.pressure,),
                        ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            IconWithBottomTitle(icon: appIcons['windSpeed'] as IconData, title: parameters!.windSpeed,),
                            IconWithBottomTitle(icon: appIcons['windDirection'] as IconData, title: parameters!.windDirection,),
                        ],
                    ),
                ],
            ),
        );
    }
}
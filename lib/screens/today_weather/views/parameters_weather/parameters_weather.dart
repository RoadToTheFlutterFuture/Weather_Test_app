import 'package:flutter/material.dart';
import 'package:weather_test_app/constants/icons/icons.dart';
import 'package:weather_test_app/widgets/icon_with_bottomTitle.dart';

class ParametersWeather extends StatelessWidget {
    final String humidity; 
    final String precipitationVolume; 
    final String pressure; 
    final String windSpeed; 
    final String windDirection; 

    const ParametersWeather({
        this.humidity = 'humidity',
        this.precipitationVolume = 'precipitation',
        this.pressure = 'pressure',
        this.windSpeed = 'speed',
        this.windDirection = 'direction',
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
                            IconWithBottomTitle(icon: appIcons['humidity'] as IconData, title: humidity,),
                            IconWithBottomTitle(icon: appIcons['other'] as IconData, title: precipitationVolume,),
                            IconWithBottomTitle(icon: appIcons['pressure'] as IconData, title: pressure,),
                        ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            IconWithBottomTitle(icon: appIcons['windSpeed'] as IconData, title: windSpeed,),
                            IconWithBottomTitle(icon: appIcons['windDirection'] as IconData, title: windDirection,),
                        ],
                    ),
                ],
            ),
        );
    }
}
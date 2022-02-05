import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class BigIconWeather extends StatelessWidget {
    static const defaultIcon = WeatherIcons.day_sunny;

    final IconData? bigIcon;
    final String cityTitle;
    final String tempTitle;

    const BigIconWeather({
        this.bigIcon = defaultIcon,
        this.cityTitle = '-',
        this.tempTitle = '-',
        Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                BoxedIcon(
                    bigIcon!,
                    size: 110,
                    color: Colors.yellow[800],
                ),
                SizedBox(height: 10,),
                Stack(
                    alignment: AlignmentDirectional.center,
                    children:[
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                                cityTitle,
                                style: TextStyle(
                                    fontSize: 16,
                                ),
                            ),
                        ),
                        Positioned(
                            left: 0,
                            child: DottedBorder(
                                child: Icon(
                                    Icons.near_me,
                                    size: 12,
                                    color: Colors.green,
                                ),
                                color: Colors.grey,
                            )
                        )
                    ]
                ),
                SizedBox(height: 10,),
                Text(
                    tempTitle,
                    style: TextStyle(
                        fontSize: 20,
                    ),
                )
            ],
        );
    }
}
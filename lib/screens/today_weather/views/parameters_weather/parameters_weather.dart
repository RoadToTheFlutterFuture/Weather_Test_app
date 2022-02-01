import 'package:flutter/material.dart';
import 'package:weather_test_app/widgets/icon_with_bottomTitle.dart';

class ParametersWeather extends StatelessWidget {
    const ParametersWeather({
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
                            IconWithBottomTitle(icon: Icons.ac_unit, title: '57%',),
                            IconWithBottomTitle(icon: Icons.ac_unit, title: '57%',),
                            IconWithBottomTitle(icon: Icons.ac_unit, title: '57%',),
                        ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            IconWithBottomTitle(icon: Icons.ac_unit, title: '57%',),
                            IconWithBottomTitle(icon: Icons.ac_unit, title: '57%',),
                        ],
                    ),
                ],
            ),
        );
    }
}
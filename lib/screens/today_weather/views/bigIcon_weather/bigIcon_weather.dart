import 'package:flutter/material.dart';

class BigIconWeather extends StatelessWidget {
    final IconData bigIcon;

    const BigIconWeather({
        this.bigIcon = Icons.wb_sunny,
        Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(
                    Icons.wb_sunny_outlined,
                    size: 110
                ),
                SizedBox(height: 10,),
                Text(
                    'London, Uk',
                    style: TextStyle(
                        fontSize: 16,
                    ),
                ),
                SizedBox(height: 10,),
                Text(
                    '22 C | Sunny',
                     style: TextStyle(
                        fontSize: 20,
                    ),
                )
            ],
        );
    }
}
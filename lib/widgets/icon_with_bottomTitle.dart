
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_test_app/constants/colors/colors.dart';

class IconWithBottomTitle extends StatelessWidget {
    final IconData icon;
    final String? title;

    const IconWithBottomTitle({
        required this.icon,
        this.title,
        Key? key
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                DottedBorder(
                    padding: const EdgeInsets.all(0),
                    color: Colors.grey,
                    child: BoxedIcon(icon, color: appColors['appIcons'],size: 25),
                ),
                SizedBox(height: 5),
                Text(title!),
            ],
        );
    }
}

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_test_app/constants/icons/icons.dart';

class WeatherDescriptionListTile extends StatelessWidget {
    final bool isLastTile;
    final String title;
    final String subtitle;
    final String trailing;
    final IconData icon;

    const WeatherDescriptionListTile({
        this.title = '',
        this.subtitle = '',
        this.trailing = '',
        this.isLastTile = false,
        this.icon = Icons.wb_sunny,
        Key? key
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Stack(
            alignment: Alignment.center,
          children: [
              Padding(
                padding: const EdgeInsets.only(left: 95),
                child: Container(
                    child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0, top: 5, bottom: 5),
                        title: Text(title),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(trailing, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
                        ),
                        subtitle: Text(subtitle),
                        style: ListTileStyle.list,
                    ),
                    decoration: isLastTile ? null : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey
                            )
                        )
                    )
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: BoxedIcon(icon, size: 60,)
              ),
          ] 
        );
    }
}
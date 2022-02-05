
import 'package:flutter/material.dart';
import 'package:weather_test_app/screens/forecast/views/weatherDescription_listTile.dart';

class DailyWeatherSilverList extends StatelessWidget {
   const DailyWeatherSilverList({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SliverList(
         delegate: SliverChildBuilderDelegate(_SilverBuilder, childCount: 5)
    );
   }

   Widget _SilverBuilder(BuildContext context, int index) {
         return  WeatherDescriptionListTile(
             isLastTile: index == 4,
             title: '16:00',
             subtitle: 'Few Clouds',
             trailing: '10',
         );
   }
}
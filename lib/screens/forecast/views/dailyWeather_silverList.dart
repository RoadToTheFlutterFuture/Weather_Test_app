
import 'package:flutter/material.dart';
import 'package:weather_test_app/constants/icons/icons.dart';
import 'package:weather_test_app/screens/forecast/views/weatherDescription_listTile.dart';

class DailyWeatherSilverList extends StatelessWidget {
    final List<dynamic> data;

   const DailyWeatherSilverList({
       required this.data,
       Key? key
    }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SliverList(
         delegate: SliverChildBuilderDelegate(_SilverBuilder, childCount: data.length)
    );
   }

   Widget _SilverBuilder(BuildContext context, int index) {
         return  WeatherDescriptionListTile(
             isLastTile: index == data.length,
             title: data[index].time,
             subtitle: data[index].description,
             trailing: '${data[index].temp}℃',
             icon:  weatherDecoration[data[index].icon] as IconData,
         );
   }
}
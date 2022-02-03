import 'package:flutter/material.dart';
import 'package:weather_test_app/widgets/weather_bottomNavigationBar/weather_bottomNavigationBar.dart';

class Forecast extends StatelessWidget {
    const Forecast({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('City'), //TODO: translate it | Today
            ),
            bottomNavigationBar: WeatherBottomNavigationBar(),
            body: RefreshIndicator(
                onRefresh: () => Future.delayed(Duration(seconds: 2), () => {}),
                child: CustomScrollView(
                    slivers: _getSilvers()
                ),
            ),
        );
    }

    List<Widget> _getSilvers(){
        return [
                WeatherSilverAppBar(status: true, title: 'First'),
                DailyWeatherSilverList(),
                WeatherSilverAppBar(title: 'Second'),
                DailyWeatherSilverList(),
        ];
    }
}

class DailyWeatherSilverList extends StatelessWidget {
   const DailyWeatherSilverList({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SliverList(
         delegate: SliverChildBuilderDelegate(_SilverBuilder, childCount: 5)
    );
   }

   Widget _SilverBuilder(BuildContext context, int index) {
         return  Container(
             padding: EdgeInsets.all(50),
             height: 100,
             color: index.isEven ? Colors.red : Colors.amber,
         );
   }
 }

 class WeatherSilverAppBar extends StatelessWidget {
     final bool status;
     final String title;

    const WeatherSilverAppBar({
        this.status = false,
        this.title = '',
        Key? key
    }) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return SliverAppBar(
            pinned: true,
            stretch: status,
            title: status ? null : Text(title),
            flexibleSpace: status ?
                FlexibleSpaceBar(
                    title: Text('first'),
                ) :
                null,
        );
    }
 }

 
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
         return  ListTileWithBottomBorder(
             isLastTile: index == 4,
             title: '16:00',
             subtitle: 'Few Clouds',
             trailing: '10',
         );
   }
}

class ListTileWithBottomBorder extends StatelessWidget {
    final bool isLastTile;
    final String title;
    final String subtitle;
    final String trailing;

    const ListTileWithBottomBorder({
        this.title = '',
        this.subtitle = '',
        this.trailing = '',
        this.isLastTile = false,
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
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Icon(Icons.wb_sunny_outlined, size: 60,)
              ),
          ] 
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
            title: status ? null : Container(
                width: double.infinity,
                child: Text(title),
            ),
            flexibleSpace: status ?
                FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                    centerTitle: false,
                    title: Container(
                        height: double.infinity,
                         alignment: Alignment.bottomLeft,
                        child: Text('First')),
                ) :
                null,
        );
    }
}

 
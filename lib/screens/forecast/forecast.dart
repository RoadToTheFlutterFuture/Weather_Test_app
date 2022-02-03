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
            SliverAppBar(
                    pinned: true,
                    title: Text('first')
                ),
                SliverFixedExtentList(
                    itemExtent: 100,
                    delegate: SliverChildListDelegate(
                        [
                            Container(color: Colors.red),
                            Container(color: Colors.purple),
                            Container(color: Colors.green),
                            Container(color: Colors.orange),
                            Container(color: Colors.yellow),
                        ],
                    ),
                ),
       ];
   }
}
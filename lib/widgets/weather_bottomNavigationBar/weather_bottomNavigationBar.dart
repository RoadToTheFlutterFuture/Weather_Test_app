import 'package:flutter/material.dart';

class WeatherBottomNavigationBar extends StatelessWidget {
    const WeatherBottomNavigationBar({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return  BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (int){},
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: 0,
            items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.wb_sunny), 
                    label: 'Today', //Todo: translate it | Today
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet_membership), 
                    label: 'Forecast', //Todo: translate it | Forecast
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), 
                    label: 'Settings', //Todo: translate it | Settings
                ),
            ]
        );
    }
}
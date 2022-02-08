import 'package:flutter/material.dart';
import 'package:weather_test_app/screens/forecast/forecast.dart';
import 'package:weather_test_app/screens/settings/settings_screen.dart';
import 'package:weather_test_app/screens/today_weather/today_weather.dart';


//  Center(child: SpinKitThreeBounce(color: Colors.grey,),)

class MainWeatherScreen extends StatefulWidget {
  const MainWeatherScreen({Key? key}) : super(key: key);

  @override
  State<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends State<MainWeatherScreen> {
  int _selectedIndex = 0;
  String _title = 'Today';

  static const List<Widget> _pages = [
    TodayWeather(),
    Forecast(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
      appBar: AppBar(
              centerTitle: true,
              title: Text(_title),
      ),

      bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: _onTapHandler,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.wb_sunny), 
                    label: 'Today', //TODO: translate it | Today
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet_membership), 
                    label: 'Forecast', //TODO: translate it | Forecast
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), 
                    label: 'Settings', //TODO: translate it | Settings
                ),
            ]
      ),
    );
  }

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          _title = 'Today';
          break;
        case 1:
          _title = 'Current City';
          break;
        case 2:
          _title = 'Settings';
          break;
        default:
            _title = '';
      }

    });
  }
}
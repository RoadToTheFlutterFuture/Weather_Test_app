import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('page_title.today_weather'.tr()),
        ),
    );
  }
}
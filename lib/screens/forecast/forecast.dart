import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Forecast extends StatelessWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('page_title.forecast'.tr()),
        ),
    );
  }
}
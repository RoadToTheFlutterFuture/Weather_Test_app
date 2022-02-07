import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text('page_title.settings'.tr()),
    );
  }
}
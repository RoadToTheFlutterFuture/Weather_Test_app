import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: const App(),
      supportedLocales: [
          Locale('ru'),
          Locale('en'), 
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'), 
    )
  );
}
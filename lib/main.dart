 import 'package:almaha_app/presentation/controlers/language/language_controler.dart';

import 'package:almaha_app/presentation/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheControler controler = Get.put(CacheControler());
  await controler.loadLang();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CacheControler controler = Get.find<CacheControler>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       locale: Locale(controler.local.value),
      localizationsDelegates:   const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en", ""), Locale("ar", "")],
      home: SplashPage(),
    );
  }
}

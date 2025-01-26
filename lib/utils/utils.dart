import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../presentation/ui/categories.dart';

class Utils{
  static  String BASE_URL="https://fakestoreapi.com/";


  static String GET_CATEGORIES="products/categories";
  static String GET_PRODUCTS="products";
  static String  LANGUAGE="language";
  static String  IS_LOGIN="IS_LOGIN";


  static  Future<void> changeLanguage(BuildContext context, Locale newLocale) async{
  Get.updateLocale(newLocale);

  // Navigate using GetX and override the context with the new locale
  Get.off(() => Localizations.override(
    context: context,
    locale: newLocale,
    child: Home(),
  ));


  }
}
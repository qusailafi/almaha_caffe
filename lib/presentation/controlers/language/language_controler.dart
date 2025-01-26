import 'dart:async';
import 'dart:ui';

import 'package:almaha_app/cahce_manger/cache_data.dart';
import 'package:almaha_app/presentation/ui/splash.dart';
 import 'package:almaha_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ui/auth/login_screen.dart';
import '../../ui/categories.dart';

class CacheControler extends GetxController {
  RxString local = "en".obs;

  RxBool isLogin=false.obs;

 isLogined()  async {
  isLogin.value = await  CacheDataManager.getBoolean(Utils.IS_LOGIN);
  Timer(Duration(seconds: 5), () {
    if (! isLogin.value)
      Get.offAll(LoginPage());
    else {
      Get.offAll(Home());
    }
  });


}
 LogOut()  async {
  await  CacheDataManager.putBooleanData(Utils.IS_LOGIN,false );
   Get.offAll(SplashPage());
}
Future<Locale> loadLang() async{
  local.value = await CacheDataManager.getStringData(Utils.LANGUAGE);

  if(local.value.isNull||local.value.isEmpty){
      local.value="en";
    }
    return Locale(local.value);
}
  Future<void> setLang(BuildContext context) async {
    if (local.value == "en")
      await CacheDataManager.putStringData(Utils.LANGUAGE, "ar");
    else
      await CacheDataManager.putStringData(Utils.LANGUAGE, "en");

    local.value = await CacheDataManager.getStringData(Utils.LANGUAGE);

Utils.changeLanguage(context,Locale(local.value));

   }

}

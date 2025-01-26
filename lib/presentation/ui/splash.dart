import 'dart:async';

import 'package:almaha_app/presentation/controlers/splash_controler.dart';
import 'package:almaha_app/presentation/ui/auth/login_screen.dart';
import 'package:almaha_app/presentation/ui/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controlers/language/language_controler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
@override
  void initState() {
     super.initState();
    CacheControler controler = Get.find( );
controler.isLogined();
}


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Image.asset("images/splash.jpg",fit: BoxFit.cover,),
    );
  }
}

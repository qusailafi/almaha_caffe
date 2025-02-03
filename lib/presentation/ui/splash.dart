import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/utils.dart';
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
      child: Image.asset(Utils.getImgePath("splash.jpg"),fit: BoxFit.cover,),
    );
  }
}

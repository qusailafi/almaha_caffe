

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../generated/l10n.dart';

class MyOrders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Scaffold(appBar: AppBar(title: Text(S.of(context).my_orders),centerTitle:true,actions: [
  IconButton(onPressed: (){
    Get.back();
  }, icon: Icon( Icons.arrow_back))
 ],),body:Column(children: [
   Text("MyOrders")
 ],),);
  }
  
}
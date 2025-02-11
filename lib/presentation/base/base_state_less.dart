

import 'package:almaha_app/presentation/controlers/errors/error_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BaseStateLess extends StatelessWidget{
  NetWorkErrorControler netWorkErrorControler=Get.find<NetWorkErrorControler>();
  @override
  Widget build(BuildContext context) {
    netWorkErrorControler.context=context;
     throw UnimplementedError();
  }


}
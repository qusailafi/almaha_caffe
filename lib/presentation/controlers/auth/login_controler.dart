

import 'package:almaha_app/presentation/controlers/base_controler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../cahce_manger/cache_data.dart';
import '../../../utils/utils.dart';
import '../../ui/categories.dart';

class LoginControler extends BaseControler{

  @override
  void onInit() {
     super.onInit();
  }
login(String userName,String pass)async{
    // when sucess
 await CacheDataManager.putBooleanData(Utils.IS_LOGIN,true);
 Get.offAll(Home());

// when sucess excute below

}
}
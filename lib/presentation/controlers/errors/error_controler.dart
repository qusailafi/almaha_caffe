import 'package:almaha_app/utils/error_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';

class NetWorkErrorControler extends GetxController {
  RxString errorMsg = "".obs;

late BuildContext context;
 String  getErrorMsg(ErrorType error ) {
    if (error == ErrorType.badRequest) {
      errorMsg.value = S.of(context).contac_us;
    } else if (error == ErrorType.unauthorized) {
      errorMsg.value = S.of(context).contac_us;
    } else if (error == ErrorType.serverError) {
      errorMsg.value = S.of(context).contac_us;
    }
    else if (error ==ErrorType.notFound){
      errorMsg.value = S.of(context).not_found_api;

    }
    else if (error == ErrorType.noInternet) {
      errorMsg.value = S.of(context).no_internet;

    }
    else {
      errorMsg.value = S.of(context).my_orders;
    }
    return errorMsg.value;
  }
}

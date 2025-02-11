 import 'package:almaha_app/utils/color_helper.dart';
import 'package:almaha_app/utils/dialogs.dart';
import 'package:almaha_app/utils/error_type.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../domain/model/general_response.dart';
 import '../../generated/l10n.dart';
import '../../presentation/controlers/errors/error_controler.dart';
import '../../utils/utils.dart';
import '../local/cache_data.dart';

class NetWorkCalls {
  NetWorkErrorControler controler=Get.find();
  Future<GeneralResponse> getApi(String apiName,Map<String, String>? headers ) async {
    GeneralResponse generalResponse = GeneralResponse(message: "", data: "");
    dynamic jsonResponse = null;
    controler.errorMsg.value="";

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult[0].toString() !=
          ConnectivityResult.none.toString()) {
        var response = await http.get(Uri.parse(Utils.BASE_URL + apiName));

        if (response.statusCode == 200) {
          jsonResponse = response.body;
          generalResponse.data = jsonResponse;
        } else if (response.statusCode == 400) {
          controler.getErrorMsg(ErrorType.badRequest);
          generalResponse.data = "";
          generalResponse.message =controler.errorMsg.value ;
        } else if (response.statusCode == 500) {
          controler.getErrorMsg(ErrorType.serverError);
          generalResponse.data = "";
          generalResponse.message =  controler.errorMsg.value;
        } else if (response.statusCode == 401) {
          controler.getErrorMsg(ErrorType.unauthorized);
          generalResponse.data = "";
          DialogHelper.logoutDialog(S.of(controler.context).log_out, S.of(controler.context).log_out, ColorHelper.brown, Colors.white);

        }
        else if (response.statusCode == 404) {
          controler.getErrorMsg(ErrorType.notFound);
          generalResponse.data = "";
          generalResponse.message =controler.errorMsg.value;
        }
        else {
          controler.getErrorMsg(ErrorType.none);
          generalResponse.data = "";
          generalResponse.message = controler.errorMsg.value;
        }
      } else {
        controler.getErrorMsg(ErrorType.noInternet);
        generalResponse.message =controler.errorMsg.value;
      }
    } catch (e) {
      generalResponse.data = "";

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;
  }

  Future<GeneralResponse> postApi(String apiName, Map<String, String>? headers,
      Map<String, dynamic>? body) async {
    GeneralResponse generalResponse = GeneralResponse(message: "", data: "");
    dynamic jsonResponse = null;
    controler.errorMsg.value="";
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult[0].toString() !=
          ConnectivityResult.none.toString()) {
        var response = await http.post(Uri.parse(Utils.BASE_URL + apiName),
            headers: headers, body: body);

        if (response.statusCode == 200) {
          jsonResponse = response.body;
          generalResponse.data = jsonResponse;
        } else if (response.statusCode == 400) {
          generalResponse.data = "";
          controler.getErrorMsg(ErrorType.badRequest);
          generalResponse.message = controler.errorMsg.value;
        } else if (response.statusCode == 500) {
          generalResponse.data = "";
          controler.getErrorMsg(ErrorType.serverError);

          generalResponse.message = controler.errorMsg.value ;
        } else if (response.statusCode == 401) {
          generalResponse.data = "";
          controler.getErrorMsg(ErrorType.unauthorized);
          // generalResponse.message = controler.errorMsg.value;
          DialogHelper.logoutDialog(S.of(controler.context).log_out, S.of(controler.context).log_out, ColorHelper.brown, Colors.white);

        }
        else if (response.statusCode == 404) {
          controler.getErrorMsg(ErrorType.notFound);
          generalResponse.data = "";
          generalResponse.message =controler.errorMsg.value;
        }

        else {
          generalResponse.data = "";
          controler.getErrorMsg(ErrorType.none);
          generalResponse.message = controler.errorMsg.value;
        }
      } else {
        controler.getErrorMsg(ErrorType.noInternet);
        generalResponse.message =controler.errorMsg.value;
      }
    } catch (e) {
      generalResponse.data = "";

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;
  }
}

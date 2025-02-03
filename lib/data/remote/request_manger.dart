 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../../domain/model/general_response.dart';
import '../../utils/utils.dart';

class NetWorkCalls {
  Future<GeneralResponse> getApi(String apiName) async {
    GeneralResponse generalResponse =
    GeneralResponse(  message: "", data: "");
    dynamic jsonResponse = null;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult[0].toString() !=
          ConnectivityResult.none.toString()) {
        var response = await http.get(Uri.parse(Utils.BASE_URL + apiName));

        if (response.statusCode == 200) {
          jsonResponse = response.body;
           generalResponse.data = jsonResponse;
        } else {

          generalResponse.data = "";
          generalResponse.message = "Api Error";
        }
      } else {

        generalResponse.message = "No Intenert Connection";
      }
    } catch (e) {
       generalResponse.data = "";

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;
  }



  Future<GeneralResponse> postApi(String apiName,Map<String,String>?headers,Map  <String,dynamic>?body) async {
    GeneralResponse generalResponse =
    GeneralResponse(  message: "", data: "");
    dynamic jsonResponse = null;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult[0].toString() !=
          ConnectivityResult.none.toString()) {
        var response = await http.post(Uri.parse(Utils.BASE_URL + apiName),headers: headers,body: body);

        if (response.statusCode == 200) {
          jsonResponse = response.body;
          generalResponse.data = jsonResponse;
        } else {

          generalResponse.data = "";
          generalResponse.message = "Api Error";
        }
      } else {

        generalResponse.message = "No Intenert Connection";
      }
    } catch (e) {
      generalResponse.data = "";

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;
  }
}
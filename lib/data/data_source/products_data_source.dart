

import 'package:almaha_app/data/request_manger.dart';

import '../../domain/model/general_response.dart';
import '../../utils/utils.dart';

class ProductsDataSource extends NetWorkCalls{
  Future<GeneralResponse>fetchProducts(   ) async{
    return  await getApi(Utils.GET_PRODUCTS );

  }
}
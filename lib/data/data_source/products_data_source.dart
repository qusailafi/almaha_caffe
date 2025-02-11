


import '../../domain/model/general_response.dart';
import '../../utils/utils.dart';
import '../remote/request_manger.dart';

class ProductsDataSource extends NetWorkCalls{
  Future<GeneralResponse>fetchProducts(   ) async{
    return  await getApi(Utils.GET_PRODUCTS,null );

  }
}
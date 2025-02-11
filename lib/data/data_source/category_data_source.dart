
import '../../domain/model/general_response.dart';
import '../../utils/utils.dart';
import '../remote/request_manger.dart';

class CategoryDataSource extends NetWorkCalls{
  Future<GeneralResponse>fetchCategories() async{
return  await getApi(Utils.GET_CATEGORIES,null);

  }
}

import '../../domain/model/general_response.dart';
import '../../domain/repo/fetch_categories_repo/fetch_categories.dart';
import '../data_source/category_data_source.dart';

class CategoriesRepoImpl implements FetchCategoriesRepo{
 final CategoryDataSource dataSource;

  CategoriesRepoImpl(this.dataSource);
  @override
  Future<GeneralResponse> fetchCategories() async{
 return    await   dataSource.fetchCategories();
   }

}
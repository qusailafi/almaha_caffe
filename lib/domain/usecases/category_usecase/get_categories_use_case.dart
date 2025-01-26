


import '../../model/general_response.dart';
import '../../repo/fetch_categories_repo/fetch_categories.dart';

class CategoriesUseCase{
  final FetchCategoriesRepo repo;
  CategoriesUseCase(this.repo);

  Future<GeneralResponse> execute() async{
    return await repo.fetchCategories();
  }
}
  import 'package:get/get_instance/src/bindings_interface.dart';

 import '../../../data/data_source/category_data_source.dart';
import '../../../data/repo_impl/categories_repo_impl.dart';
 import '../../../domain/repo/fetch_categories_repo/fetch_categories.dart';
import '../../../domain/usecases/category_usecase/get_categories_use_case.dart';
import 'categories_controler.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<CategoriesRepoImpl>(() => CategoriesRepoImpl(Get.find()));
    Get.lazyPut<FetchCategoriesRepo>(() =>CategoriesRepoImpl (Get.find()));

    Get.lazyPut<CategoryDataSource>(() =>CategoryDataSource ( ));

     Get.lazyPut<CategoriesUseCase>(() => CategoriesUseCase(Get.find()));

     Get.lazyPut<CategoriesControler>(() => CategoriesControler(Get.find()));
   }
}
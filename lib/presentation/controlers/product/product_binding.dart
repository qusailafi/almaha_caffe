
import 'package:almaha_app/data/data_source/products_data_source.dart';
import 'package:almaha_app/data/repo_impl/products_repo_impl.dart';
import 'package:almaha_app/domain/repo/fetch_products_repo/fetch_products_repo.dart';
import 'package:almaha_app/domain/usecases/products/get_products.dart';
import 'package:almaha_app/presentation/controlers/product/product_controler.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepoImpl>(() => ProductsRepoImpl(Get.find()));
    Get.lazyPut<FetchProductsRepo>(() =>ProductsRepoImpl (Get.find()));

    Get.lazyPut<ProductsDataSource>(() =>ProductsDataSource ( ));

    Get.lazyPut<ProductsUseCase>(() => ProductsUseCase(Get.find()));

    Get.lazyPut<ProductControler>(() => ProductControler(Get.find()));
  }

}
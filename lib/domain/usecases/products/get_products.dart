
import 'package:almaha_app/domain/repo/fetch_products_repo/fetch_products_repo.dart';

import '../../model/general_response.dart';

class ProductsUseCase{
  final FetchProductsRepo repo;
  ProductsUseCase(this.repo);
  Future<GeneralResponse> execute() async{
    return await repo.fetchProducts( );
  }
}
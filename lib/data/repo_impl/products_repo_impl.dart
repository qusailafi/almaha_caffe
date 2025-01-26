
import 'package:almaha_app/data/data_source/products_data_source.dart';
import 'package:almaha_app/domain/model/general_response.dart';
import 'package:almaha_app/domain/repo/fetch_products_repo/fetch_products_repo.dart';

class ProductsRepoImpl extends FetchProductsRepo {
  ProductsDataSource dataSource=ProductsDataSource();
  ProductsRepoImpl(this.dataSource);
  @override
  Future<GeneralResponse> fetchProducts( ) async {
    return await dataSource.fetchProducts( );
  }

}

import 'dart:convert';

import 'package:almaha_app/domain/model/products/products.dart';
import 'package:almaha_app/domain/usecases/products/get_products.dart';
import 'package:almaha_app/presentation/controlers/base_controler.dart';
import 'package:get/get.dart';

import '../../../domain/model/general_response.dart';

class ProductControler extends BaseControler{
ProductsUseCase useCase;

ProductControler(this.useCase);
RxList<Products>products=<Products>[].obs;
RxInt selectedProductIndex=0.obs;
RxInt count=1.obs;
  @override
void onInit() {
  super.onInit();
  getProducts();
  count.value=1;
}  getProducts( ) async{
  isLoading.value=true;

  GeneralResponse response= await useCase.execute( );
  try{
    final List<dynamic> jsonData = json.decode(response.data);

    if (jsonData.length > 0) {
      products.addAll(jsonData.map((item) => Products.fromJson(item)).toList());
    } else {
      message.value = "No Products Avilable";
    }
  }catch (e){
    message.value = response.message;

  }
  finally{
    isLoading.value=false;
  }
}
}
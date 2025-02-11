
import 'dart:convert';

 import 'package:flutter/material.dart';
import 'package:get/get.dart';

 import '../../../domain/model/general_response.dart';
import '../../../domain/usecases/category_usecase/get_categories_use_case.dart';
import '../../../utils/color_helper.dart';
import '../../../utils/dialogs.dart';
import '../base_controler.dart';
class CategoriesControler extends BaseControler{
  final CategoriesUseCase useCase;
CategoriesControler(this.useCase);
  RxList<String> categories = <String>[].obs;
RxString selectedCategory="".obs;
  @override
  void onInit() {
    super.onInit();
    getData();
   }
getData()async{
  isLoading.value=true;
  GeneralResponse response= await useCase.execute();
try{
  if (List<String>.from(json.decode(response.data)).length > 0) {

    categories.addAll(List<String>.from(json.decode(response.data)));

  } else {
    message.value = "No Categories Avilable";
  }
}catch (e){
  message.value = response.message;

}
finally{
  isLoading.value=false;
}

}
}


import 'package:almaha_app/presentation/controlers/product/product_binding.dart';
import 'package:almaha_app/presentation/controlers/product/product_controler.dart';
import 'package:almaha_app/presentation/ui/products/details.dart';
import 'package:almaha_app/utils/color_helper.dart';
import 'package:almaha_app/utils/font_helper.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../controlers/categories/categories_controler.dart';
import 'cart.dart';

class ProductsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ProductBinding().dependencies();
    ProductControler controler=Get.find<ProductControler>();
    final CategoriesControler categoryControler = Get.find<CategoriesControler>();

    return Scaffold(appBar: AppBar(title: Text(categoryControler.selectedCategory.value),centerTitle: true,actions: [

//
 Stack(children: [
   IconButton(onPressed:(){
     // Get.back();
     Get.to(MyCart());

   }, icon: Icon(Icons.shopping_cart,color: ColorHelper.brown ),),
  ],)


     ],),
       body:  Container(child:
   Obx((){
     if(controler.isLoading.value){
       return Container(alignment:Alignment.center,child:  CircularProgressIndicator(),);
     }else{
      return GridView.builder(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 3, // number of items in each row
           mainAxisSpacing: 8.0, // spacing between rows
           crossAxisSpacing: 8.0, // spacing between columns
         ),
         padding: EdgeInsets.all(8.0), // padding around the grid
         itemCount: controler.products.length, // total number of items
         itemBuilder: (context, index) {
           return Container(
             color: Colors.blue, // color of grid items
             child: Center(
               child:
                   InkWell(onTap: (){
                     controler.selectedProductIndex.value=index;
                     controler.count.value=1;
                     Get.to(ProductDetails());
                   },child:        Stack(children: [
                     Container(width: MediaQuery.of(context).size.width,child:
                     Image.network(controler.products[index].image,fit: BoxFit.fill,),),
                     Center( child:
                     Text(controler.products[index].price.toString()+S.of(context).currency,
                       style: TextStyle(fontSize: Helper.midFont, color: Colors.white),
                     ),)
                   ],),)
        ,
             ),
           );
         },
       );
     }
   }),),);
  }

}
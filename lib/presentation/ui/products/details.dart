
import 'package:almaha_app/presentation/controlers/product/product_controler.dart';
import 'package:almaha_app/utils/color_helper.dart';
import 'package:almaha_app/utils/font_helper.dart';
import 'package:almaha_app/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/button.dart';

class ProductDetails extends StatelessWidget{
  ProductControler controler=Get.find<ProductControler>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(controler.products[controler.selectedProductIndex.value].title),centerTitle: true,),body:
    Column(
      children: [
        Container(   child:
        Image.network(controler.products[controler.selectedProductIndex.value].image,height: Helper.calculateRatioHeight(context, .25),fit: BoxFit.cover,),),
        Container( child:
        cardWidget(null, Column(
          children: [
            Container(child:

            Text(textAlign: TextAlign.start,S.of(context).price+":"+controler.products[controler.selectedProductIndex.value].price.toString(),style: TextStyle(color: ColorHelper.brown),),padding: EdgeInsets.symmetric(horizontal: Helper.paddingViews,vertical:  Helper.midPaddingViews ),width: Helper.calculateRatioWidth(context, double.infinity)),


            Flexible(
              child: Container(child:

              Text(
                textAlign: TextAlign.start,controler.products[controler.selectedProductIndex.value].description,style: TextStyle(color: ColorHelper.brown),),padding: EdgeInsets.symmetric(horizontal: Helper.paddingViews),width: Helper.calculateRatioWidth(context, double.infinity),height: Helper.calculateRatioHeight(context, double.infinity),
              ),
            )],
        ), null, Helper.calculateRatioHeight(context, .3)),width: Helper.calculateRatioWidth(context, double.infinity),),
        Row(children: [

          Container(width: Helper.calculateRatioWidth(context, .8), padding: EdgeInsets.all(Helper.paddingViews) ,child:
          evelvatedButton((){

          },S.of(context).add_to_cart,ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorHelper.brown),foregroundColor: MaterialStateProperty.all(Colors.white)),null


          ),),
          Obx((){
            return Container(width: Helper.calculateRatioWidth(context, .2),child:   Column(
              children: [
                evelvatedButton((){
                  controler.count.value+=1;
                },"+",ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorHelper.brown),foregroundColor: MaterialStateProperty.all(Colors.white)),null

                ),
                Text(controler.count.value.toString(),style: TextStyle(color: ColorHelper.brown,fontSize: Helper.smallfont),),
                evelvatedButton((){
                  if(controler.count.value>1)
                    controler.count.value-=1;
                },"-",ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorHelper.brown),foregroundColor: MaterialStateProperty.all(Colors.white)),null


                )

              ],),);
          })
        ],)
      ],
    ),);
  }

}
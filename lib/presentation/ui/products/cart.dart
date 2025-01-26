

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../generated/l10n.dart';
import '../../../utils/color_helper.dart';
import '../../../utils/font_helper.dart';
import '../../../widgets/card_widget.dart';
import '../../controlers/categories/categories_binding.dart';
import '../../controlers/categories/categories_controler.dart';
import '../../controlers/language/language_controler.dart';

class MyCart extends StatelessWidget{
  @override
  Widget build(BuildContext context)   {
     final CategoriesControler controler = Get.find<CategoriesControler>();

     return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_cart),centerTitle: true,
      ),
       body: Center(
        child: Obx(() {
          if (controler.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controler.categories.isNotEmpty) {
            return ListView.builder(
              itemCount:     controler.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {

                  },
                  child:
                  Dismissible(direction: DismissDirection.endToStart,background:Container(color: Colors.red,child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center,children: [

                    Text(S.of(context).remove,style: TextStyle(fontSize: Helper.midFont,color: Colors.white,),textAlign: TextAlign.center,),
                  ],),),onDismissed: (direction){
                    // controler.categories.removeAt(index);

                  },key: Key(controler.categories[index]), child:  cardWidget(
                      null,
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Container(alignment:Alignment.center,child:
                          Text(                  textAlign: TextAlign.center,        controler.categories[index],
                            style:   TextStyle(
                              fontSize: Helper.midFont,

                              color: ColorHelper.brown,
                            ),
                          ),)
                        ],
                      ),
                      EdgeInsets.all(5),
                      MediaQuery.of(context).size.height*.095 )),
                );
              },
            );
          } else {
            return Text(controler.message.value);
          }
        }),
      ),
    );
  }

}